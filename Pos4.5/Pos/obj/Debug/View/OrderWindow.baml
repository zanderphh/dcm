   M S B A M L   `   `   `  ����O  K点餐猫(快餐版), Version=0.0.0.1, Culture=neutral, PublicKeyToken=nullclr-namespace:PosPos  5   	   #clr-namespace:Pos.ViewPos.View  5   	   -clr-namespace:Pos.ViewModelPos.ViewModel  5	   	   @ <Utils, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null( clr-namespace:Lib;assembly=UtilsLib 5   	       Pos.View.OrderWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0ignorehttp://www.galasoft.ch/ignore     5   	   !appclr-namespace:Pos     5   	   (localclr-namespace:Pos.View     5   	   *vmclr-namespace:Pos.ViewModel     5	   	   c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5
   	   N JFirstFloor.ModernUI, Version=1.0.8.0, Culture=neutral, PublicKeyToken=null0mui&http://firstfloorsoftware.com/ModernUI  5   	   *Lib clr-namespace:Lib;assembly=Utils  5   	   f bGalaSoft.MvvmLight.Platform, Version=5.2.0.37226, Culture=neutral, PublicKeyToken=5f873c45e98af8a1-Custom http://www.galasoft.ch/mvvmlight  66      Pos.View.BaseWindow    Loaded$  Window_Loaded��5   �    � WindowStartupLocation$ CenterScreen=�6	   $��812.439��6.   $��520.725��6>    � Icon$ /Resources/Logo.png��6O      BlankWindow#���   6j    � WindowState$ 	Maximized=�6�    � WindowStyle$
 None=�6�   
������� � 	Resources 5         Pos.App  app/   )Pos.ViewModel.SelectedItemToListConverter  itemcvt  dishtypeItemsPanelTemplate K� IsItemsHost $� Orientation  DishTypeItemTemplate �� Padding  TextBlockCommonStyle  	FontMidel	 �� Mode
 �� NotifyOnValidationError �� UpdateSourceTrigger �� ValidatesOnDataErrors �� ValidatesOnExceptions  OrderedDishItemTemplate  CommonBorderStyle � ColumnDefinitions ��Name 	 	FontSmall �� StringFormat �� Path ��Name 
 FontAwesome  LittleRoundButtonStyle �� RelativeSource �� AncestorType   Pos.View.OrderWindow ��Name �� TextWrapping �� 
IsReadOnly  TextBlockSameStyle  	FontLarge  DishItemTemplate � RowDefinitions��%�	  &	       &	      &	 &     &	 k     &	 �    7 
 7 
 &	 �    7 	   5   
   6     5   
   6)   �� 5   
   .R�5      $�  . $ 
Horizontal=�68   5      �� 5   
   .R�5      � $��34��6   $	��120��6#   .+�5      �� $ 0q�6�   {�.  #���  6�   #���  6  $
��Auto��6<  $
��Auto��6J  $��4q�6m  $��Center=�6x  ��6    �� *DishType.Name+$	 TwoWay=�
 . $ PropertyChanged=� .  . ��6W  Z� 6x  5      5      �� 5   
   .R�5      �� #���  6   {�. $��0q�6j   $��0q�6~   ��6S   Z� ��6�   Z� ._�5      � $��50��6    5      �� 5      �� 5      $	��120 �6+   .+�5!      �� .+�5"      �� $ dishname��6$   #���  6P   $
��Auto��6   $
��Auto��6�   $��CharacterEllipsis=�6�   #���  6�   ��66   �� *
DishName+6�   �� 5#      $ price��6$   #��� 	 63   #���  6Z   $
��Auto��6�   $
��Auto��6�   $��Bottom=�6�   $��0,4,0,0q�6�   ��5$      `� 5%   "   $ 
￥{0}/{1}��6/   .1�5&   &   �� $ Price�6.   �� 5'   &   $
 Unit�6.   5(   #   5*      5+      ]� 5,      $��1��6    $��2,0,10,0q�60   .+�5-      �� $ btnMinus��6!   $��30��63   $	����6?   8��  $��30��6~   #���  6�   $��0q�6�   #��� 	 6�   $
��Left=�6�   $��-1��6�  
���  ����6  �� *DataContext.ModifyQtyCommand+ �� *FindAncestor+"  ��6�  Z� 6�  �� 5.      $ btnAdd��6!   $	����61   8�� $��30��6n   #���  6y   $��Right=�6�   $��30��6�   $��0q�6�   $��1��6j  #��� 	 6�  
���  ����6�   �� *DataContext.ModifyQtyCommand+ �� *FindAncestor+"  ��6  Z� 6�  �� 5/      $	 qty��6"   $ NoWrap=�6/   $
��Auto��6F    . ���	#FFF70303$��Center=�6�   $��Center=�6�   $
��Auto��6�   $��0q�6�   $��0q�6  #���  6  #���  6L  $��Center=�6s  $��Center=�6�  ��6}   Z� ��6�   Z� ��6�  �� *
Quantity+.��6�  50      51      52      53      54      �� 55   
   .R�56      � $��80��6   $	��150��6    57      �� 58      �� 59      $
��auto �6$   .+�5;      �� $
��Wrap=�6   #���  6�   #���  6�   $
��Auto��6�   $
��Auto��6   $��Stretch=�6  ��60   �� *Name+
 .  .  . 6  �� 5<      8��  $��1��6B   $��1��6S   $��Bottom=�6`   ��5=      `� 5>      $ 
￥{0}/{1}��6'   .1�5?      �� $ Price�6&   �� 5@      $
 Unit�6&   5A      5C      5D      5E      5F       � DataContext 5G      �� 5H   
   $	 OneWay=�6   $ Order�6      Locator �� Source# [ 6-   .��5J      � -   5         �Name$
 root��5J       � IsSharedSizeScope .  5K   
   �� 5L      $
��auto �6   �� 5M      �� 5N      $��80 �6   .+�5P   
   ��   HeaderBorder#���  6   ._�5Q      �  5R      �� 5S      �� 5T      $��1 �6'   .+�5V      ]� -   5         ]�Name$ header��5V      ��.  .+�5W      �� -   5         ��Name$ image��5W      $��62.205��6+   $��/Resources/Logo.png��6:   �� 5X      -   5        $ 
tbSoftWare��5X       $
��Wrap=�64   $��点餐猫收银系统��6H   #���  6W   $
��Auto��6�   $��36(�6�     HeaderForground#���  6�   ]� 5Y      $��
10,25,10,0q�6    .+�5Z      �� -   5        $ textBlock_time��5Z   $   $
��Wrap=�6<   $��2016-04-23 11:11:11��6P   #���  6l   $
��Auto��6�   #��� 	 6�   #���  6�   $��	0,17,0,16q�6�   �� 5[      -   5        $ textBlock_Copy2��5[   $   $
��Wrap=�6=   $��
收银员:��6Q   #���  6_   $
��Auto��6�   #��� 	 6�   #���  6�   $��
10,18,0,17q�6�   �� 5\      -   5        $ textBlock_Copy3��5\   $   $
��Wrap=�6=      OperatorName#��Z 6Q   #���  6z   $
��Auto��6�   #��� 	 6�   #���  6�   $��	0,17,0,16q�6  $��30��6   �� 5]      -   5        $ textBlock_s��5]   $   $
��Wrap=�69   $��商家:��6M   #���  6Z   $��20��6�   #��� 	 6�   #���  6�   $��
20,18,0,17q�6�   �� 5^      -	   5        $ textBlock_shop��5^   $   $
��Wrap=�6<       ShopName#��Z  6P   #���  6u   $
��Auto��6�   #��� 	 6�   #���  6�   $��	0,17,0,16q�6  $
��Left=�6  $
��Left=�61  $��30��6L  �� 5`      -
   5        $ textBlock_v��5`   $   $
��Wrap=�69   $��
版本号:��6M   #���  6[   $
��Auto��6�   #��� 	 6�   #���  6�   $��
20,18,0,17q�6�   $y�	Collapsed=�6  �� 5a      -   5        $ textBlock_version��5a   $   $
��Wrap=�6?   !   Version#��Z! 6S   #���  6w   $
��Auto��6�   #��� 	 6�   #���  6�   $��	0,18,0,17q�6
  $
��Left=�6  $
��Left=�63  $y�	Collapsed=�6N  5b      5c      �� 5d      -   5        $ close��5d      $	����6(   #��� 
 6;   $��Center=�6f   #���  6�   
���   �$��36(�6�   $��0q�6�   #���  6  $��Right=�6P  $��Center=�6l  $��0,0,20,0q�6�  ��6�   Z� 6�  5f      5g      � 5h   
   $��1��6    5i      �� 5j      $	��300 �6#   $	��250��6/   " z� SharedSizeGroup$" moneyamount��6>   �� 5k      $
��Auto �6#   �� 5l      $��* �6#   .+�5n      �  5o      �� 5p      $��50 �6$   �� 5q      .+�5s      �� # �� Padding$# 4q�6   $��0,0,0,2q�6&   #���  6@   ._�5t      ]� ��.  .+�5u      �� -   5        $ button��5u   !   $��清空��61   $
��auto��6>     ButtonCommonStyle#���  6L   ��6x   �� *ClearOrderedDishCommand+$	 OneWay=��� 5v      -   5        $ 
textBlock2��5v   $   #���  6{   $
��auto��6�     FontFamilySt#���  6�   $��Center=�6�   $��Center=�6  $��Right=�6  $��80��63  ��69   �� *OrderedDishQty+$	 OneWay=�$ 共 {0} 件��63  5w      5x      �� 5y      -   5        $ ��Name$$ orderedDishlistBox��5y      #���  67   $��Center=�6�   $��Center=�6�   ��. $% �� IsSynchronizedWithCurrentItem$% FalseY�6  $��1��6,    BorderListBoxItemStyle#���  6O  $��Disabled=�6�  $��0,1,0,0q�6�  ��6p   �� *CurorderDetailList+��69  Z� & �� SelectedIndex& 6�  �� *OrderedDishSelectedIndex+5z      5|      � 5}      $��2��6   $��Stretch=�6#    5~      �� 5      $��50 �6$   �� 5�      .+�5�      �� ' �� Orientation$' Vertical=�6   .+�5�      �� $��50��6   #���  6�   $��0,0,0,2q�6�   ._�5�      �� -   5        $$ dishTypeListBox��5�   "   #���  6;   #���  6u   $��Disabled=�6�   $��Disabled=�6	    DishTypeListBoxItemStyle#���  6=  ��6�   �� *DishAndTypeList+��6}  Z� .  (System.Windows.Interactivity.Interaction(   Triggers( 5�      /  )System.Windows.Interactivity.EventTrigger  5�   "   )   	EventName$) SelectionChanged��61   .  (System.Windows.Interactivity.TriggerBase*   Actions.* 5�   &   /  )GalaSoft.MvvmLight.Command.EventToCommand  +   PassEventArgsToCommand+ . ,   CommandParameter, 6Z   �� *SelectedIndex+- �� ElementName$- dishTypeListBox��.   Command. 6�   �� * DishTyeSelectionChangedCommand+$	 OneWay=�5�   #   5�      5�      5�      �� 5�      -   5        $$ dishlistBox��5�      $��1��6/   $	��100��6=   #���  6L   #���  6~     FillWrapListBoxStyle#���  6�   $��0q�6�   $��Disabled=�6�   $
��Auto=�6�  ��65  �� *SelectedItem+/ �� 	Converter#/ [ $- dishTypeListBox����6�  Z� ( 5�        5�      $) MouseLeftButtonUp��6)   .* 5�      	  Lib.RoutedEventCommand	  �
  �Lib.MapEventToCommandBase`1[[System.Windows.RoutedEventArgs, PresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]0 
  Command0 65   �� *DataContext.AddDishCommand+ �� *FindAncestor+"  5�      5�      5�      �� 5�      -   5        1 ��Name$1 gridSplitter��5�      $��1��61   ���	#88888888$��2��6X   5�      �� 5�   
   $��2��6   $��0,2,0,0q�6c   #���  6}   ._�5�      �  5�      �� 5�      $" moneyamount��6'   �� 5�      .+�5�      �� -   5        $ 
textBlock3��5�      $
��Wrap=�60   $��20(�6D   $��Center=�6R   $��Center=�6o   ��6�   �� *OrderedDishAmount+$	 OneWay=�$ 合计金额￥{0}���� 5�      -   5        $ button1��5�      $��1��6*   $��收款��6:   #���  6G   $
��Auto��6s   $��Right=�6�   $��0,4,4,4q�6�   $��169.097��6�   $
��Bold"�6�   $��Stretch=�6�   ���	#FFF50909
���������6�   �� *CheckOutCommand+$	 OneWay=�64  �� 5�      -   5        $ button1_Copy��5�      $��1��6/   $��历史账单��6?   #���  6N   $
��Auto��6z   $��0,4,178.097,4q�6�   $
��Bold"�6�   $��Stretch=�6�   ���	#FFF50909
�������$��Right=�6  $��169.097��60  5�      5�      5�      5�      