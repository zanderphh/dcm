   M S B A M L   `   `   `  ����N  JFirstFloor.ModernUI, Version=1.0.8.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:FirstFloor.ModernUIFirstFloor.ModernUI  5      [2clr-namespace:FirstFloor.ModernUI.Windows.Controls$FirstFloor.ModernUI.Windows.Controls  5      _4clr-namespace:FirstFloor.ModernUI.Windows.Navigation&FirstFloor.ModernUI.Windows.Navigation  5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089  �� MergedDictionaries �� Source7    1FirstFloor.ModernUI.Windows.Controls.ModernWindow �� 
TargetType �� Property   WindowBackgroundContent �� Value  DefaultFontFamily  DefaultFontSize  
WindowText  WindowBorder&   System.Windows.Media.TextOptions �� 
TargetType ��Name%  System.Windows.SystemParameters$   WindowNonClientFrameThickness �� Source	 � 	Resources  Key
 �Name � RowDefinitions    BackgroundContent � ColumnDefinitions � Title  ModernWindowTitle    IsTitleVisible � DataContext   BooleanToVisibilityConverter �� 	Converter    
TitleLinks'  !System.Windows.Shell.WindowChrome   IsHitTestVisibleInChrome �� Orientation ��Name	 �� X1	 �� Y1	 �� X2	 �� Y2  SeparatorBackground 	 SystemButtonLink �� ElementName �� Triggers �� Binding �� RelativeSource �� Value �� 
TargetName 

 Accent     LogoData! �� ConverterParameter  NullToVisibilityConverter" �� Stretch#   FirstFloor.ModernUI.Resources#   Minimize$ � ToolTip  SystemButton#  System.Windows.SystemCommands%   MinimizeWindowCommand& �� AncestorType' �� Mode( ��Name)   Restore*   RestoreWindowCommand+ � UseLayoutRounding,   Maximize-   MaximizeWindowCommand.   Close  SystemCloseButton/   CloseWindowCommand7   1FirstFloor.ModernUI.Windows.Controls.ModernButton0   EllipseDiameter1   	IconWidth2   
IconHeight3   IconData4   Back5   /FirstFloor.ModernUI.Windows.Controls.ModernMenu5    MenuLinkGroups6   
LinkGroups7   SelectedSource8 �� Mode6   0FirstFloor.ModernUI.Windows.Controls.ModernFrame9  Name:    ContentLoader;   ContentLoader<   Source=   ResizeGripDirection> �� Triggers? P� Property@ P� Value  WindowBorderActiveA ]� 
ConditionsB �� PropertyC �� ValueD   CornerRadiusE   GlassFrameThicknessF   UseAeroCaptionButtonsG   NonClientFrameEdges�� 5      D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    :x,http://schemas.microsoft.com/winfx/2006/xaml     5      .modernui!clr-namespace:FirstFloor.ModernUI  5      ?controls2clr-namespace:FirstFloor.ModernUI.Windows.Controls  5      C
navigation4clr-namespace:FirstFloor.ModernUI.Windows.Navigation  5      8d2http://schemas.microsoft.com/expression/blend/2008  6]   Bmc;http://schemas.openxmlformats.org/markup-compatibility/2006  6�     5      �� 5   
   $7 1/FirstFloor.ModernUI;component/Assets/Button.xaml?�6   �� 5	   
   $; 5/FirstFloor.ModernUI;component/Assets/Converters.xaml?�6   �� 5
   
   $: 4/FirstFloor.ModernUI;component/Assets/TextBlock.xaml?�6   %9  '         7  7  7 	 7  7  7  7  7  �� 5      "   6   .�5   
   ��  �@  BackgroundContent# �   6.   �� 5   
    � ��# �  6'   �� 5   
    � ��# �  6%   �� 5   
    � ��# �  6'   �� 5   
    � ��# �  6(   �� 5   
    � ��$	 800��6"   �� 5   
    � ��$	 640��6#   �� 5   
    � ��$	 320��6%   �� 5   
    � ��$	 320��6&   �� 5   
    �@�UseLayoutRounding . 6.   �� 5   
    �@ TextFormattingMode$ Display=�6;   �� 5   
    � �� 5      �� 5      "   6"   .R�5      �� $ WindowBorder��6   #��z��6�   ��63   �� # Z 	 5      ���� 5       BackgroundAnimation 6)   5!      ._�5#      �� #��z��6!   $��1q�6M   ._�5$      �� .u�5%   "   � $
 
LayoutRoot��6'    5&   &   �� 5'   *   $
��Auto �68   �� 5(   *   $
��Auto �68   �� 5)   *   $��* �68   .+�5-   &   �� $��5��65   #��z 6F   � 50   &    51   *   �� 52   .   $��* �6?   �� 53   .   $
��Auto �6?   �� 54   .   $
��Auto �6?   �� 55   .   $
��auto �6?   .+�59   *   �� #��z 64   $	��8,0q�6S   $��Center=�6`   8��  # z 5:      y�5;      �� 8  �� 5>   *   $��1��67   #��z 6G   $��0,0,24,0q�6r    . ��5?   .   �� 5@   2   .R�5A   6   �� $ 
Horizontal=�6A   5B   3   ��5D   .   �� 5E   2   .R�5F   6   �� $ 
Horizontal=�6A   .+�5G   :   �� $ 	Separator��6?   $ .5��6R   $ 3��6Z   $ .5��6a   $ 12��6i   $	��5,0q�6q   $��Center=�6~   #���  6�   �� 5I   :   $*��$navigation:LinkCommands.NavigateLink��5J      8�� ��5I   A   �� *DisplayName+��5K      �� *Source+��5L      �� $ ContentFrame��5M      5N   7    5O   6   �� 5P   :    6F   ��  �� *PreviousData+ 6�   Z� .a�5Q   >   �� $ 	Separator��6[    � y�$ 	Collapsed=�6r   5R   ;   5T   3   5V   +   �� 5Y   *   $��2��61   #��� 
 6A   $��36��6g   $��36��6r   $	��8,0q�6~   # z  5Z      y�5[      �� $! inverse��8  ._�5\   .   F� $
" Fill=�6D   
�������$��24��6`   $��24��6k   $��Center=�6w   $��Center=�6�   ��63   �� 6�   5]   +   �� 5`   *   $��3��65   $ 
Horizontal=�6E   $	��Top=�6^    . .+�5a   .   �� #$ Z# 6�   8�� ��65   �� # Z% .��5b   2   � $��13��67   $��12��6B   $z�1,0,0,1,0,1W�6N   .+�5c   6   F� ����    ��[ � z ��[ 	$��8��6N   $��7��6X   $��Center=�6c   $��Center=�6~   $��2��5d   ~   ��6   �� *
Foreground+ �� "& ��$' FindAncestor=�6~   5e   3   5f   /   � 5g   .   $��1,0,1,0q�63   .+�5h   2   �� $( Restore��69   #$ Z) 6�   8�� $y�	Collapsed=�6�   ��6J   �� # Z* .��5i   6   � $��13��6;   $��12��6F   + . $z�1,0,0,1,.5,.5W�6k   .+�5j   :   F� X���Ѐ�     � z     � z ��[ �    ��- р�[ ��- �    �� р�[ �� р�[  z �     z 	$��8��6u   $��8��6   $��Center=�6�   $��Center=�6�   $��1��5k      ��6   �� *
Foreground+ �� "& ��$' FindAncestor=�6   5l   7   5m   3   �� 5n   2   $( Maximize��69   #$ Z, 6�   8�� ��6K   �� # Z- .��5o   6   � $��13��6;   $��12��6F   .+�5p   :   F� +����    @B �@T� @B �@T�  z �     z 	$��9��6\   $��8��6f   $��Center=�6q   $��Center=�6�   $��2��5q      ��6   �� *
Foreground+ �� "& ��$' FindAncestor=�6   5r   7   5s   3   5t   /   �� 5u   .   #$ Z. 6}   8�� ��65   �� # Z/ .��5v   2   � $��13��67   $��12��6B   $z�1,0,0,1,0,1W�6N   .+�5w   6   F� +����        � z ��j � z     �    ��j 	$��8��6X   $��7��6b   $��Center=�6m   $��Center=�6�   $	��1.5��5x   ~   ��6   �� *
Foreground+ �� "& ��$' FindAncestor=�6~   5y   3   5z   /   5{   +   5|   '   � 5~   &   $��1��6+    5   *   �� 5�   .   $��42 �6?   �� 5�   .   $��* �6?   .+�5�   *     $��
8,10,-33,0q�6@   $
��Left=�6T   $	��Top=�6o   $0 24Q�5�      $1 12Q�6!   $2 12Q�60   a3 ��@����O�@������p\-�������@��� �8@����ا  6n� �8��� ������� �p\-��O�@����O$#��NavigationCommands.BrowseBack��5�      #$ Z4 5�       . $��67��5�   :   ��5�      �� $ ContentFrame��5�   :     5�   *   $��1��6>   #6 z5 5�      7 5�      �� *Source+$ ContentFrame��$8 TwoWay=�5�      5�   '     5�   &   $9 ContentFrame��6;   $��3��6Q   $��2��6^   $��
42,8,16,16q�6o   #; z: 6�   < 6�   �� *ContentSource+$8 TwoWay=� �� *TemplatedParent+6�   � 5�   &   $
 
ResizeGrip��68   $��2��6+   
������ $y�	Collapsed=�6e   $��Right=�6|   $��Bottom=�6�   $= BottomRight=�6�   .+�5�   *   F� $��12��6/   $��12��6:   $��1q�6F   #���  5�      $��1��5�      $
" None=�5�      �����@B ��� ���- ��� �@KL ��� ���j ��� �@T� ��� ��ا ��� Ѐ� @T� р� �ا Ѐ�[ @T� р�[ �ا Ѐ�� @T� р�� �ا �@KL ��[ ���j ��[ �@T� ��[ ��ا ��[ Ѐ�[ @KL р�[ ��j Ѐ�� @KL р�� ��j �@T� �� ��ا �� Ѐ�� @B р�� ��- 5�      5�   '   5�   #   5�      5�      5�      > 5�      P� 5�      ? �@�IsActive@ . . �5�      �� # �  6<    � ��5�      P� 5�      ? �@�WindowState$@ 	Maximized=�69   . �5�      �� $ Maximize��6%    � y�$ 	Collapsed=�6Q   �� 5�      $ Restore��6%    � y�$ Visible=�6P   �� 5�      $ 
LayoutRoot��6%    � ��$ 7q�6O   5�      P� 5�      ? �@�WindowState$@ Normal=�69   . �5�      �� $ Maximize��6%    � y�$ Visible=�6Q   �� 5�      $ Restore��6%    � y�$ 	Collapsed=�6P   5�      ]� 5�      A 5�      �� 5�   "   B �@�
ResizeMode$C CanResizeWithGrip=�6B   �� 5�   "   B �@�WindowState$C Normal=�6C   ./�5�      �� $ 
ResizeGrip��6%    � y�$ Visible=�6S   5�      5�      5�      �� 5�   
    �@ WindowChrome 5�        5�      $D 0��6   $E 1q�60   F . $
G None=�6e   5�      5�      5�      