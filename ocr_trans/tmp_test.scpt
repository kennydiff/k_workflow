FasdUAS 1.101.10   ��   ��    k             l     ����  r       	  m      
 
 �   " O p e n A I   T r a n s l a t o r 	 o      ���� 0 appname appName��  ��        l     ��  ��    "  set appName to "Dictionary"     �   8   s e t   a p p N a m e   t o   " D i c t i o n a r y "      l     ��  ��      tell application appName     �   2   t e l l   a p p l i c a t i o n   a p p N a m e      l     ��  ��     
 -- launch     �      - -   l a u n c h      l     ��  ��     	 activate     �      a c t i v a t e     !   l     �� " #��   "  
 -- reopen    # � $ $    - -   r e o p e n !  % & % l     �� ' (��   '  	 end tell    ( � ) )    e n d   t e l l &  * + * l     ��������  ��  ��   +  , - , l     ��������  ��  ��   -  . / . l     �� 0 1��   0 ) # ���Ƿ��н��̵Ĳ��� �ȷŵ�������...    1 � 2 2 (  \f/T&g	��zv�g�b~  QHe>R0Sؑ�ge . . . /  3 4 3 l    5���� 5 r     6 7 6 m    ��
�� boovfals 7 o      ���� 0 b_app_running  ��  ��   4  8 9 8 l     ��������  ��  ��   9  : ; : l   ' <���� < O    ' = > = Z    & ? @���� ? I   �� A��
�� .coredoexnull���     **** A l    B���� B 6   C D C 2   ��
�� 
prcs D =    E F E 1    ��
�� 
pnam F o    ���� 0 appname appName��  ��  ��   @ r    " G H G m     ��
�� boovtrue H o      ���� 0 b_app_running  ��  ��   > m    	 I I�                                                                                  sevs  alis    \  Macintosh HD                   BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   ;  J K J l     ��������  ��  ��   K  L M L l     ��������  ��  ��   M  N O N l  ( V P���� P Z   ( V Q R���� Q H   ( * S S o   ( )���� 0 b_app_running   R O   - R T U T k   4 Q V V  W X W I  4 9������
�� .miscactvnull��� ��� null��  ��   X  Y Z Y l  : :�� [ \��   [   reopen    \ � ] ]    r e o p e n Z  ^ _ ^ l  : :�� ` a��   `   launch    a � b b    l a u n c h _  c d c I  : A�� e��
�� .ascrcmnt****      � **** e b   : = f g f o   : ;���� 0 appname appName g m   ; < h h � i i    a c t i v a t i n g��   d  j k j l  B B�� l m��   l   reopen    m � n n    r e o p e n k  o�� o Z   B Q p q���� p =   B E r s r o   B C���� 0 appname appName s m   C D t t � u u " O p e n A I   T r a n s l a t o r q k   H M v v  w x w l  H H�� y z��   y w q ����`OpenAI Translator` ��ν��rustӦ�ô򿪺�����������Ҫdelay 0.2~0.3 ��, ������޷�����������ִ�к����ճ���߼�    z � { { �  �ّ� ` O p e n A I   T r a n s l a t o r `  b@�v� r u s t^�u(bS_ _�ab���\� �� d e l a y   0 . 2 ~ 0 . 3  y� ,  T&ROe�l�T/R�[�et�bg�LT�bv�|��4�;�� x  |�� | I  H M�� }��
�� .sysodelanull��� ��� nmbr } m   H I ~ ~ ?ə�������  ��  ��  ��  ��   U 4   - 1�� 
�� 
capp  o   / 0���� 0 appname appName��  ��  ��  ��   O  � � � l     ��������  ��  ��   �  � � � l  W i ����� � O   W i � � � O   [ h � � � k   b g � �  � � � l  b b�� � ���   �   set visible to true    � � � � (   s e t   v i s i b l e   t o   t r u e �  ��� � r   b g � � � m   b c��
�� boovtrue � 1   c f��
�� 
pisf��   � 4   [ _�� �
�� 
prcs � o   ] ^���� 0 appname appName � m   W X � ��                                                                                  sevs  alis    \  Macintosh HD                   BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   �C=tell application "System Events"	if not (exists (processes where name is appName)) then		log "�޽���"		tell application appName			activate			reopen			launch			log appName & " activating"			-- reopen			if appName = "OpenAI Translator" then				-- ����`OpenAI Translator` ��ν��rustӦ�ô򿪺�����������Ҫdelay 0.4 ��, ������޷�����������ִ�к����ճ���߼�				delay 0.3			end if		end tell	else		log "�н���"		tell application "System Events"			tell process appName				-- set visible to true				set frontmost to true			end tell		end tell	end ifend tell    � � � �&  t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 i f   n o t   ( e x i s t s   ( p r o c e s s e s   w h e r e   n a m e   i s   a p p N a m e ) )   t h e n  	 	 l o g   "e���z "  	 	 t e l l   a p p l i c a t i o n   a p p N a m e  	 	 	 a c t i v a t e  	 	 	 r e o p e n  	 	 	 l a u n c h  	 	 	 l o g   a p p N a m e   &   "   a c t i v a t i n g "  	 	 	 - -   r e o p e n  	 	 	 i f   a p p N a m e   =   " O p e n A I   T r a n s l a t o r "   t h e n  	 	 	 	 - -  �ّ� ` O p e n A I   T r a n s l a t o r `  b@�v� r u s t^�u(bS_ _�ab���\� �� d e l a y   0 . 4  y� ,  T&ROe�l�T/R�[�et�bg�LT�bv�|��4�;��  	 	 	 	 d e l a y   0 . 3  	 	 	 e n d   i f  	 	 e n d   t e l l  	 e l s e  	 	 l o g   "g	��z "  	 	 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 	 	 t e l l   p r o c e s s   a p p N a m e  	 	 	 	 - -   s e t   v i s i b l e   t o   t r u e  	 	 	 	 s e t   f r o n t m o s t   t o   t r u e  	 	 	 e n d   t e l l  	 	 e n d   t e l l  	 e n d   i f  e n d   t e l l  �  � � � l     ��������  ��  ��   �  ��� � l     ��������  ��  ��  ��       �� � � 
������   � ��������
�� .aevtoappnull  �   � ****�� 0 appname appName�� 0 b_app_running  ��   � �� ����� � ���
�� .aevtoappnull  �   � **** � k     i � �   � �  3 � �  : � �  N � �  �����  ��  ��   �   �  
���� I�� ��������� h�� t ~������ 0 appname appName�� 0 b_app_running  
�� 
prcs �  
�� 
pnam
�� .coredoexnull���     ****
�� 
capp
�� .miscactvnull��� ��� null
�� .ascrcmnt****      � ****
�� .sysodelanull��� ��� nmbr
�� 
pisf�� j�E�OfE�O� *�-�[�,\Z�81j  eE�Y hUO� **��/ *j 	O��%j O��  
�j Y hUY hO� *��/ e*�,FUU
�� boovtrue��  ascr  ��ޭ