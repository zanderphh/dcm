   M S B A M L   `   `   `  ����O  K点餐猫(快餐版), Version=0.0.0.1, Culture=neutral, PublicKeyToken=null#clr-namespace:Pos.ViewPos.View  5   	   -clr-namespace:Pos.ViewModelPos.ViewModel  5   	       Pos.View.TemplateWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0ignorehttp://www.galasoft.ch/ignore     5   	   (localclr-namespace:Pos.View     5   	   *vmclr-namespace:Pos.ViewModel     5   	   N JFirstFloor.ModernUI, Version=1.0.8.0, Culture=neutral, PublicKeyToken=null0mui&http://firstfloorsoftware.com/ModernUI  5	   	      BlankWindow#��[  5   	     � WindowStartupLocation$  CenterScreen=�5   	    � 
ResizeMode$ NoResize=�6.   $	��660��6D   $	��472��6P    � WindowStyle$
 None=�6]    � AllowsTransparency . ��6p   Z� .��5      �� 
�������$��1q�6     �� CornerRadius$ 5��64   ���	#FFFF0303._�5   
   � -   5         �Name$
 root��5       � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      .+�5      ��   HeaderBorder#���  6   
���  ��$ 5,5,0,0��6M   ._�5      � .+�5      �� -   5         ��Name$ tblTitle��5       $��48(�62   $
��Bold"�6@    �� TextAlignment$ Center=�6R   
�������	 �� Padding$	 0,8,0,0q�6|   �� 6�   $�模版窗口��6�   6�   �� 5      -   5        
 ��Name$
 close��5      $	����6,     FontAwesome#���  6?   $��Center=�6j     LittleRoundButtonStyle#���  6�   
���   �$��36(�6�   $��0q�6�   
�������$��Right=�68  $��Center=�6T  $��0,0,20,0q�6o  ��6�   Z� 6o  5      5      5      5      5      