   M S B A M L   `   `   `  ����  点餐猫(快餐版)    Pos.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0ignorehttp://www.galasoft.ch/ignore     5   	   $	��300��5   	   $	��300��5	   	     � Title$  MVVM Light Application��5
   	    � DataContext 5   	   �� *Main+   Locator �� Source# [   � 	Resources 5       �� MergedDictionaries �� Source �� 
TargetType �� Property �� Value	 �� 
TargetType
 ��Name J� Opacity �� CornerRadius J� BitmapEffect O� Opacity O� GlowSize O� 	GlowColor �� RelativeSource �� Path �� 
StartPoint �� EndPoint � Offset � Color ��Name F� Color F� 	Direction F� ShadowDepth F� Softness F� Opacity �� Triggers P� Property P� Value  N� EnterActions	! W� To" g� Duration# �� 
TargetName$ �� TargetProperty	% �� To& g� 	BeginTime' N� ExitActions  buttonTemplate( A�Name) ��Name* �� ScaleX+ �� ScaleY�� 5   
    5      �� 5      $ Skins/MainSkin.xaml?�6%   %�  '��       &	     �� 5      " ��6   .�5      ��  � ��
 �   �6/   �� 5       � �� 5      �� 5      "	 ��6*   .R�5      �� $

 back��6%   $	 0.8Q�63   $ 3��6A    5   "   O� 5   &   $	 0.7Q�6<   $ 0Q�6J    6W   ��  �� *TemplatedParent+$1 +(Button.Background).(SolidColorBrush.Color)���5   "   �� 5    &   $	 0,0&�6:   $ 0,1.5&�6K   ��5"   .   � � 5#   2   $ 0Q�6�    6?   ��  �� *TemplatedParent+$1 +(Button.Background).(SolidColorBrush.Color)�6�   � 5$   2   $	 0.4Q�6�    6?   ��  �� *TemplatedParent+$1 +(Button.Background).(SolidColorBrush.Color)�6�   � 5%   2   $
 #FFF��6?   $ 1Q�6L   5&   /   5(   '   ._�5+   "   �� $

 fore��6)   $��1q�67   $ 3��6K   ���#5555��5,   &   �� 5-   *   $	 0,0&�6>   $	 0,1&�6O   ��5/   2   � � 50   6   $ #6FFF��6C   $	 0.5Q�6Q   � 51   6   $ #1111��6C   $
 0.51Q�6Q   52   3   54   +   ._�57   &   �� $ content��67   $��Center=�6H   $��Center=�6e   #��z��6�    58   *   F� 59   .   $
 #000��6E   $	 -90Q�6R   $ 2Q�6b   $	 0.1Q�6r   $	 0.3Q�6�   5;   '   5<   #   5=       5?      P� 5A   "    �@J�IsMouseOver .   5B   &   �� 5C   *   .��5D   .   �� .��5E   2   W� $! 6X�6B   $" 0:0:0.2D�6I   $
# back��6\   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6y   �� 5F   2   $% #AFFFX�6A   $& 0:0:0.2X�6L   $" 0:0:0.2D�6`   $
# fore��6s   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6�   �� 5G   2   $% #3FFFX�6A   $& 0:0:0.2X�6L   $" 0:0:0.2D�6`   $
# fore��6s   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6�   5H   /   5I   +   ' 5K   &   �� 5L   *   .��5M   .   �� .��5N   2   W� $" 0:0:0.2D�6B   $
# back��6U   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6r   �� 5O   2   $" 0:0:0.2D�6A   $
# fore��6T   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6q   �� 5P   2   $" 0:0:0.2D�6A   $
# fore��6T   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6q   5Q   /   5R   +   5T   #   P� 5V   "    � �� .   5W   &   �� 5X   *   .��5Y   .   �� .��5Z   2   W� $! 3X�6B   $" 0:0:0.1D�6I   $
# back��6\   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6y   �� 5[   2   $% #3AAAX�6A   $" 0:0:0.1D�6L   $
# fore��6_   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6|   �� 5\   2   $% #2111X�6A   $" 0:0:0.1D�6L   $
# fore��6_   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6|   5]   /   5^   +   ' 5`   &   �� 5a   *   .��5b   .   �� .��5c   2   W� $" 0:0:0.1D�6B   $
# back��6U   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6r   �� 5d   2   $" 0:0:0.1D�6A   $
# fore��6T   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6q   �� 5e   2   $" 0:0:0.1D�6A   $
# fore��6T   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6q   5f   /   5g   +   5i   #   P� 5k   "    � {� .  . �5l   &   ��  � �� �#B4446C     5m   &   �� 5n   *   .��5o   .   �� .��5p   2   W� $! 0X�6B   $" 0:0:0.3D�6I   $
# back��6\   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6y   W� 5q   2   $! 1X�6B   $" 0:0:0.1D�6I   $# content��6\   $F$ @(ContentPresenter.BitmapEffect).(DropShadowBitmapEffect.Opacity)�6|   W� 5r   2   $
! -135X�6B   $" 0:0:0.1D�6L   $# content��6_   $H$ B(ContentPresenter.BitmapEffect).(DropShadowBitmapEffect.Direction)�6   �� 5s   2   $
% #FFFX�6A   $" 0:0:0.3D�6K   $# content��6^   $D$ >(ContentPresenter.BitmapEffect).(DropShadowBitmapEffect.Color)�6~   �� 5t   2   $% #D555X�6A   $" 0:0:0.3D�6L   $
# fore��6_   $2$ ,(Border.BorderBrush).(SolidColorBrush.Color)�6|   �� 5u   2   $% #CEEEX�6A   $" 0:0:0.3D�6L   $
# fore��6_   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6|   �� 5v   2   $% #CDDDX�6A   $" 0:0:0.3D�6L   $
# fore��6_   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6|   5w   /   5x   +   ' 5z   &   �� 5{   *   .��5|   .   �� .��5}   2   W� $" 0:0:0.1D�6B   $
# back��6U   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6r   W� 5~   2   $" 0:0:0.1D�6B   $# content��6U   $F$ @(ContentPresenter.BitmapEffect).(DropShadowBitmapEffect.Opacity)�6u   W� 5   2   $" 0:0:0.1D�6B   $# content��6U   $H$ B(ContentPresenter.BitmapEffect).(DropShadowBitmapEffect.Direction)�6u   �� 5�   2   $" 0:0:0.1D�6A   $# content��6T   $D$ >(ContentPresenter.BitmapEffect).(DropShadowBitmapEffect.Color)�6t   �� 5�   2   $" 0:0:0.1D�6A   $
# fore��6T   $2$ ,(Border.BorderBrush).(SolidColorBrush.Color)�6q   �� 5�   2   $" 0:0:0.1D�6A   $
# fore��6T   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6q   �� 5�   2   $" 0:0:0.1D�6A   $
# fore��6T   $U$ O(Border.Background).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6q   5�   /   5�   +   5�   #   5�      5�      5�      �� 5�      " ��6+   .�5�      ��  � �� 5�      �� 5�      "	 ��6*   .R�5�      � .+�5�   "   �� $

 back��6)   $	 0.8Q�67   $ 2��6E    5�   &   O� 5�   *   $	 0.8Q�6@   $ 0Q�6N   $	 Red��6[   ._�5�   &   A� $��49��6.   $��49��69   
���  ��5�   '   5�   #   A� 5�   "   $( outerCircle��6*   $��50��6?   $��50��6J   ��5�   &   �� 5�   *   $	 0,0&�6>   $	 0,1&�6O   .��5�   .   � $ 0Q�6;   $ DarkOliveGreen��6F   � 5�   .   $ 1Q�6;   $ Azure��6F   5�   +   5�   #   A� 5�   "   $��40��6*   $��40��65   ��5�   &   �� 5�   *   $	 0,0&�6>   $	 0,1&�6O   .��5�   .   � $ 0Q�6;   $ White��6F   � 5�   .   $ 1Q�6;   $ Transparent��6F   5�   +   5�   #   �� 5�   "   ._�5�   &   �� $) content��60   $��Center=�6A   $��Center=�6^   #��z��6y   5�   '   5�   #   5�       5�      P� 5�   "    �@J�IsMouseOver .   5�   &   �� 5�   *   .��5�   .   �� .��5�   2   W� $! 10X�6B   $" 0:0:0.2D�6J   $
# back��6]   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6z   �� 5�   2   $% #4FFFX�6A   $& 0:0:0.2X�6L   $" 0:0:0.2D�6`   $# outerCircle��6s   $P$ J(Ellipse.Fill).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6�   �� 5�   2   $% #3FFFX�6A   $& 0:0:0.2X�6L   $" 0:0:0.2D�6`   $# outerCircle��6s   $P$ J(Ellipse.Fill).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6�   5�   /   5�   +   ' 5�   &   �� 5�   *   .��5�   .   �� .��5�   2   W� $" 0:0:0.2D�6B   $
# back��6U   $<$ 6(Border.BitmapEffect).(OuterGlowBitmapEffect.GlowSize)�6r   �� 5�   2   $" 0:0:0.2D�6A   $# outerCircle��6T   $P$ J(Ellipse.Fill).(LinearGradientBrush.GradientStops)[0].(GradientStop.Color)�6x   �� 5�   2   $" 0:0:0.2D�6A   $# outerCircle��6T   $P$ J(Ellipse.Fill).(LinearGradientBrush.GradientStops)[1].(GradientStop.Color)�6x   5�   /   5�   +   5�   #   P� 5�   "    � �� . . �5�   &   ��  � z� 5�   *   �� 5�   .   $* .9Q�6=   $+ .9Q�6I   5�   '   �� 5�   &    �@J�RenderTransformOrigin$ .5,.5&�6N   5�   #   5�      5�      5�      5�      .��5�      � -   5        , �Name$, LayoutRoot_Copy��5�      .+�5�   
   �� $��36(�6   $
��Bold"�5�      
���� ��$��Center=�5�      $��Center=�5�      $
��Wrap=�5�      ��5�      �� *WelcomeTitle+5�      �� 5�   
   -   5        - ��Name$- Select��5�      $��Select��6!   $
��Left=�62   $��	10,10,0,0q�6M   $	��Top=�6`   $��75��6x     Double1#���  6�   �� 5�   
   -   5        $- Update��5�      $��Update��6!   $
��Left=�62   $��	10,40,0,0q�6M   $	��Top=�6`   $��75��6x   6�   �� 5�   
   -   5        $- Delete��5�      $��Delete��6!   $
��Left=�62   $��	10,70,0,0q�6M   $	��Top=�6`   $��75��6x   6�   �� 5�   
   -   5        $- button��5�      $��Login��6!   $
��Left=�61   $��
117,10,0,0q�6L   $	��Top=�6`   $��75��6x   6�   �� 5�   
   -   5        . ��Name$. textBox��5�      $
��Left=�6#   $��30��6>   $��
117,40,0,0q�6J   / �� TextWrapping$
/ Wrap=�6^   $	��Top=�6r   $	��120��6�   $
��1234��6�     TextBlockSameStyle#���  6�   �� 5�   
   -   5        $. textBox1��5�      $
��Left=�6$   $��23��6?   $��
117,70,0,0q�6K   $
/ Wrap=�6_   $	��Top=�6  $	��120��6)  ��6s   �� *Name+0 �� Mode$0 TwoWay=�1 �� NotifyOnValidationError1 . 2 �� UpdateSourceTrigger$2 PropertyChanged=�3 �� ValidatesOnDataErrors3 . 4 �� ValidatesOnExceptions4 . 6)  �� 5�   
   -   5        $- button1��5�      $��+��6"   $��0,0,222.909,111.222q�6.     roundButton#���  6a   $��20(�6�   ���	#FF3A596E$��57.538��6�   $��Bottom=�6�   $��Right=�6�   $��59.091��6�   $��2q�6  $��Center=�6  $��Center=�6;  � 5�   
   $��0��6   $��
0,10,166,0q�6   $y�	Collapsed=�63   5 � ColumnDefinitions5 5�      �� 5�      $��* �6#   �� 5�      $��30 �6#   .+�5�      �� 
���  ��$��0q�6)   $��0��64   �� 6E   $(�"aaaaaaaaaaaaaaaaaaaagggggggggggggg��6I   6v   �� 5�      $��10,0,0,0q�6   
��� ���$��Stretch=�6>   $��1��6\   �� 6m   $�CCCCCC��6q   6�   5�      �� 5�   
   -	   5        $- button2��5�      $��Button��6"   $��92,111.64,125,0q�63   $	��Top=�6L   6d   5�      5      