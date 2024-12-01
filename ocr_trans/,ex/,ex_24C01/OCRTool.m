// OCRTool.m
#import <Foundation/Foundation.h>
#import <Vision/Vision.h>
#import <CoreImage/CoreImage.h>

@interface OCRTool : NSObject
+ (NSString *)recognizeTextFromImage:(NSString *)imagePath;
@end

@implementation OCRTool

+ (NSString *)recognizeTextFromImage:(NSString *)imagePath {
    // 加载图片
    NSURL *imageURL = [NSURL fileURLWithPath:imagePath];
    CIImage *image = [CIImage imageWithContentsOfURL:imageURL];
    if (!image) {
        NSLog(@"Error: Cannot load image at path: %@", imagePath);
        return nil;
    }
    
    // 创建OCR请求
    VNImageRequestHandler *handler = [[VNImageRequestHandler alloc] initWithCIImage:image options:@{}];
    VNRecognizeTextRequest *request = [[VNRecognizeTextRequest alloc] initWithCompletionHandler:nil];
    request.recognitionLanguages = @[@"zh-Hans", @"en-US"];
    request.usesLanguageCorrection = YES;
    
    // 执行OCR
    NSError *error = nil;
    [handler performRequests:@[request] error:&error];
    if (error) {
        NSLog(@"Error: %@", error.localizedDescription);
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

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc != 2) {
            NSLog(@"Usage: %s <image_path>", argv[0]);
            return 1;
        }
        
        NSString *imagePath = @(argv[1]);
        NSString *result = [OCRTool recognizeTextFromImage:imagePath];
        
        if (result) {
            printf("%s", [result UTF8String]);
            return 0;
        } else {
            return 1;
        }
    }
}