// OCRTool.m

// # 编译
// clang -framework Foundation -framework Vision -framework CoreImage OCRTool.m -o ocrtool

// # 使用方式1：截图模式
// ./ocrtool

// # 使用方式2：指定图片
// ./ocrtool /path/to/image.png


#import <Foundation/Foundation.h>
#import <Vision/Vision.h>
#import <CoreImage/CoreImage.h>

@interface OCRTool : NSObject
+ (NSString *)recognizeTextFromImage:(NSString *)imagePath;
+ (NSString *)captureAndRecognize;
@end

@implementation OCRTool

// 实现图片识别方法
+ (NSString *)recognizeTextFromImage:(NSString *)imagePath {
    // 加载图片
    NSURL *imageURL = [NSURL fileURLWithPath:imagePath];
    CIImage *image = [CIImage imageWithContentsOfURL:imageURL];
    if (!image) {
        NSLog(@"无法加载图片: %@", imagePath);
        return nil;
    }
    
    // 创建OCR请求
    VNImageRequestHandler *handler = [[VNImageRequestHandler alloc] initWithCIImage:image options:@{}];
    VNRecognizeTextRequest *request = [[VNRecognizeTextRequest alloc] initWithCompletionHandler:nil];
    request.recognitionLanguages = @[
        @"zh-Hans",  // 简体中文
        @"zh-Hant",  // 繁体中文
        @"en-US"    // 英语(美国)
    ];
    request.usesLanguageCorrection = YES;
    
    // 执行OCR
    NSError *error = nil;
    [handler performRequests:@[request] error:&error];
    if (error) {
        NSLog(@"OCR Failure: %@", error);
        return nil;
    }
    
    // 处理结果
    NSMutableString *result = [NSMutableString string];
    for (VNRecognizedTextObservation *observation in request.results) {
        VNRecognizedText *recognizedText = [[observation topCandidates:1] firstObject];
        if (recognizedText) {
            [result appendString:recognizedText.string];
            [result appendString:@"\n"];
        }
    }
    
    return result;
}

// OCRTool.m 中添加实现
+ (NSString *)captureAndRecognize {
    NSString *tempDir = NSTemporaryDirectory();
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
    NSString *screenshotPath = [tempDir stringByAppendingPathComponent:[NSString stringWithFormat:@"screenshot_%@.png", timestamp]];
    
    // NSLog(@"截图将保存到: %@", screenshotPath);
    
    // 调用系统截图命令
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/usr/sbin/screencapture";
    task.arguments = @[@"-i", @"-s", screenshotPath];
    
    NSError *error = nil;
    if (![task launchAndReturnError:&error]) {
        NSLog(@"Screenshot Error: %@", error);
        return nil;
    }
    
    [task waitUntilExit];
    
    // 检查文件是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:screenshotPath]) {
        NSLog(@"Screenshot file not found: %@", screenshotPath);
        return nil;
    }
    
    // 识别文字
    NSString *result = [self recognizeTextFromImage:screenshotPath];
    
    // 删除临时文件
    NSError *removeError = nil;
    if (![[NSFileManager defaultManager] removeItemAtPath:screenshotPath error:&removeError]) {
        NSLog(@"Deleting temporary files error: %@", removeError);
    }
    
    return result;
}

// 保持原有的captureAndRecognize方法不变...

@end

static void handleOCRResult(NSString *result) {
    NSString *trimmedResult = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (result && trimmedResult.length > 0) {
        printf("%s\n", [result UTF8String]);
    } else {
        printf("OCR Failure\n");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc == 1) {
            NSString *result = [OCRTool captureAndRecognize];
            handleOCRResult(result);
        } else if (argc == 2) {
            NSString *imagePath = [NSString stringWithUTF8String:argv[1]];            
            NSString *result = [OCRTool recognizeTextFromImage:imagePath];
            handleOCRResult(result);
        }
        return 0;
    }
}