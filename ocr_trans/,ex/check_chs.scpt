FasdUAS 1.101.10   ��   ��    k             l     ����  r       	  m      
 
 �    h e l l o  N-   w o r l d 	 o      ���� 0 querystr queryStr��  ��        l     ��������  ��  ��        l     ��  ��      ����Ƿ���������ַ�     �     h�g�f/T&ST+N-e�[W{&      l    ����  r        I   �� ��
�� .sysoexecTEXT���     TEXT  b    	    m       �   � p y t h o n 3   / U s e r s / k e n / S y n c / w s / 2 . S c r i p t / k _ w o r k f l o w / o c r _ t r a n s / c h e c k _ c h s . p y    n        1    ��
�� 
strq  o    ���� 0 querystr queryStr��    o      ���� 0 
haschinese 
hasChinese��  ��         l   # !���� ! Z    # " #�� $ " =    % & % o    ���� 0 
haschinese 
hasChinese & m     ' ' � ( (  T r u e # k     ) )  * + * l   �� , -��   ,   queryStr ���������ַ�    - � . .     q u e r y S t r  ST+N-e�[W{& +  /�� / I   �� 0��
�� .sysodlogaskr        TEXT 0 m     1 1 � 2 2 N T h e   s t r i n g   c o n t a i n s   C h i n e s e   c h a r a c t e r s .��  ��  ��   $ I   #�� 3��
�� .sysodlogaskr        TEXT 3 m     4 4 � 5 5 ^ T h e   s t r i n g   d o e s   n o t   c o n t a i n   C h i n e s e   c h a r a c t e r s .��  ��  ��      6 7 6 l     ��������  ��  ��   7  8 9 8 l      �� : ;��   :,& set myString to "Hello, world 1234!"set hasNumber to do shell script "echo " & quoted form of myString & " | grep -q '[0-9]' && echo yes || echo no"if hasNumber is "yes" then	display dialog "The string contains a number."else	display dialog "The string does not contain a number."end if     ; � < <L   s e t   m y S t r i n g   t o   " H e l l o ,   w o r l d   1 2 3 4 ! "  s e t   h a s N u m b e r   t o   d o   s h e l l   s c r i p t   " e c h o   "   &   q u o t e d   f o r m   o f   m y S t r i n g   &   "   |   g r e p   - q   ' [ 0 - 9 ] '   & &   e c h o   y e s   | |   e c h o   n o "  i f   h a s N u m b e r   i s   " y e s "   t h e n  	 d i s p l a y   d i a l o g   " T h e   s t r i n g   c o n t a i n s   a   n u m b e r . "  e l s e  	 d i s p l a y   d i a l o g   " T h e   s t r i n g   d o e s   n o t   c o n t a i n   a   n u m b e r . "  e n d   i f   9  = > = l     ��������  ��  ��   >  ?�� ? l      �� @ A��   @'! set queryStr to " cool baby ! "-- if queryStr contains "[[:punct:][:space:]]" thenif queryStr contains "[:space:]" then	-- log queryStr	log "appName  ...  OpenAI Translator"	return "OpenAI Translator"else	-- log queryStr	log "appName  ...  Dictionary"	return "Dictionary"end if     A � B BB   s e t   q u e r y S t r   t o   "   c o o l   b a b y   !   "  - -   i f   q u e r y S t r   c o n t a i n s   " [ [ : p u n c t : ] [ : s p a c e : ] ] "   t h e n  i f   q u e r y S t r   c o n t a i n s   " [ : s p a c e : ] "   t h e n  	 - -   l o g   q u e r y S t r  	 l o g   " a p p N a m e     . . .     O p e n A I   T r a n s l a t o r "  	 r e t u r n   " O p e n A I   T r a n s l a t o r "  e l s e  	 - -   l o g   q u e r y S t r  	 l o g   " a p p N a m e     . . .     D i c t i o n a r y "  	 r e t u r n   " D i c t i o n a r y "  e n d   i f  ��       �� C D��   C ��
�� .aevtoappnull  �   � **** D �� E���� F G��
�� .aevtoappnull  �   � **** E k     # H H   I I   J J  ����  ��  ��   F   G 
 
�� ������ ' 1�� 4�� 0 querystr queryStr
�� 
strq
�� .sysoexecTEXT���     TEXT�� 0 
haschinese 
hasChinese
�� .sysodlogaskr        TEXT�� $�E�O���,%j E�O��  
�j Y �j ascr  ��ޭ