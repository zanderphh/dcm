   M S B A M L   `   `   `  ����O  K点餐猫(快餐版), Version=0.0.0.1, Culture=neutral, PublicKeyToken=null#clr-namespace:Pos.ViewPos.View  5   	   -clr-namespace:Pos.ViewModelPos.ViewModel  5   	       Pos.View.HisorderWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0ignorehttp://www.galasoft.ch/ignore     5   	   (localclr-namespace:Pos.View     5   	   *vmclr-namespace:Pos.ViewModel     5   	   N JFirstFloor.ModernUI, Version=1.0.8.0, Culture=neutral, PublicKeyToken=null0mui&http://firstfloorsoftware.com/ModernUI  5	   	      BlankWindow#��[  5   	     � WindowStartupLocation$  CenterScreen=�5   	   $	��660��6.   $	��472��6:    � WindowStyle$
 None=�6G    � AllowsTransparency .  � WindowState$ 	Maximized=�6�   ��6Z   Z� .��5      �� 
�������._�5   
   � -   5         �Name$
 root��5       � RowDefinitions 5      �� 5      $��80 �6    �� 5      �� 5      $��80 �6    .+�5      ��   HeaderBorder#���  6   
���  ��._�5      � .+�5      �� -   5         ��Name$ tblTitle��5       $��48(�62   $
��Bold"�6@    �� TextAlignment$ Center=�6R   
������� �� Padding$ 0,8,0,0q�6|   $��已结客单查询��6�   �� 5      -   5        	 ��Name$	 close��5      $	����6,     FontAwesome#���  6?   $��Center=�6j     LittleRoundButtonStyle#���  6�   
���   �$��36(�6�   $��0q�6�   
�������$��Right=�68  $��Center=�6T  $��0,0,20,0q�6o  ��6�   Z� 6o  5      5      �� 5      $��1��6   
���  ��$��1q�64   ._�5      � 
 � ColumnDefinitions
 5      �� 5      $
��Auto �6+   �� 5       $��2 �6+   �� 5!      .+�5#      �� $��1��6#   &   System.Windows.Controls.DataGrid  5$      -   5          Name$ grid_h��5$         AutoGenerateColumns .     
IsReadOnly . ���	#00000000   GridLinesVisibility$ 
Horizontal=�6u     TouchHeight   	RowHeight# �  6�     	FontMidel#���  6�   $   HorizontalScrollBarVisibility$ Disabled=�6     CanUserAddRows .     Columns 5%      0  *System.Windows.Controls.DataGridTextColumn  5&      ,  &System.Windows.Controls.DataGridColumn   Header$ 单号��6P   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *
HisorderId+6P     5'      $ 结账日期��6m    61   �� *
BillDate+ �� StringFormat$ {0:yyyy-MM-dd}��6m     5(      $ 	操作员��6R    61   �� *Operatorname+6R     5)      $ 合计金额��6O    61   �� *	Shouldpay+6O     5*      $ 付款方式��6M    61   �� *	Paytype+6M   5,        5-      -   5        $ grid_d��5-   /   $��2��6    .   . # �  6m   #���  6�    5.        5/      $ 代码��6L    61   �� *DishId+6L     50      $ 品名��6N    61   �� *
dishname+6N     51      $ 类别��6N    61   �� *
DishName+6N     52      $ 单位��6J    61   �� *Unit+6J     53      $ 数量��6N    61   �� *
Quantity+6N     54      $ 单价��6K    61   �� *Price+6K   56      57      58      �� 59      -   5        $	 button1��59      $��2��6&   $��返回��63     ButtonCommonStyle#���  6@   $
��Auto��6l   $��Right=�6z   $��0,4,4,4q�6�   $��169.097��6�   $
��Bold"�6�   $��Stretch=�6�   ���	#FFF50909
�������6  �� 5:      -   5        $	 button1_Copy��5:      $��2��6+   $��重打账单��68   #���  6G   $
��Auto��6s   $��	0,4,178,4q�6�   $
��Bold"�6�   $��Stretch=�6�   ���	#FFF50909
�������$��Right=�6   $	��169��6  5;      5<      5=      