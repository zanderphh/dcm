﻿#pragma checksum "..\..\..\..\View\OrderWindow.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "EDCAAA98F6934F3EED3C9102C06A91AB"
//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.42000
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

using FirstFloor.ModernUI.Presentation;
using FirstFloor.ModernUI.Windows;
using FirstFloor.ModernUI.Windows.Controls;
using FirstFloor.ModernUI.Windows.Converters;
using FirstFloor.ModernUI.Windows.Navigation;
using GalaSoft.MvvmLight.Command;
using Lib;
using Pos;
using Pos.View;
using Pos.ViewModel;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interactivity;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Pos.View {
    
    
    /// <summary>
    /// OrderWindow
    /// </summary>
    public partial class OrderWindow : Pos.View.BaseWindow, System.Windows.Markup.IComponentConnector {
        
        
        #line 76 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid root;
        
        #line default
        #line hidden
        
        
        #line 88 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DockPanel header;
        
        #line default
        #line hidden
        
        
        #line 89 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image image;
        
        #line default
        #line hidden
        
        
        #line 90 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tbSoftWare;
        
        #line default
        #line hidden
        
        
        #line 92 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_time;
        
        #line default
        #line hidden
        
        
        #line 93 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_Copy2;
        
        #line default
        #line hidden
        
        
        #line 94 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_Copy3;
        
        #line default
        #line hidden
        
        
        #line 95 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_s;
        
        #line default
        #line hidden
        
        
        #line 96 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_shop;
        
        #line default
        #line hidden
        
        
        #line 98 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_v;
        
        #line default
        #line hidden
        
        
        #line 99 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock_version;
        
        #line default
        #line hidden
        
        
        #line 102 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button close;
        
        #line default
        #line hidden
        
        
        #line 119 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button button;
        
        #line default
        #line hidden
        
        
        #line 120 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock2;
        
        #line default
        #line hidden
        
        
        #line 123 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox orderedDishlistBox;
        
        #line default
        #line hidden
        
        
        #line 134 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox dishTypeListBox;
        
        #line default
        #line hidden
        
        
        #line 143 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox dishlistBox;
        
        #line default
        #line hidden
        
        
        #line 151 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.GridSplitter gridSplitter;
        
        #line default
        #line hidden
        
        
        #line 159 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock textBlock3;
        
        #line default
        #line hidden
        
        
        #line 160 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button button1;
        
        #line default
        #line hidden
        
        
        #line 161 "..\..\..\..\View\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button button1_Copy;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/点餐猫(快餐版);component/view/orderwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\View\OrderWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal System.Delegate _CreateDelegate(System.Type delegateType, string handler) {
            return System.Delegate.CreateDelegate(delegateType, this, handler);
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.root = ((System.Windows.Controls.Grid)(target));
            return;
            case 2:
            this.header = ((System.Windows.Controls.DockPanel)(target));
            return;
            case 3:
            this.image = ((System.Windows.Controls.Image)(target));
            return;
            case 4:
            this.tbSoftWare = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 5:
            this.textBlock_time = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 6:
            this.textBlock_Copy2 = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 7:
            this.textBlock_Copy3 = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 8:
            this.textBlock_s = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 9:
            this.textBlock_shop = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 10:
            this.textBlock_v = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 11:
            this.textBlock_version = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 12:
            this.close = ((System.Windows.Controls.Button)(target));
            
            #line 102 "..\..\..\..\View\OrderWindow.xaml"
            this.close.Click += new System.Windows.RoutedEventHandler(this.closeButton_Click);
            
            #line default
            #line hidden
            return;
            case 13:
            this.button = ((System.Windows.Controls.Button)(target));
            return;
            case 14:
            this.textBlock2 = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 15:
            this.orderedDishlistBox = ((System.Windows.Controls.ListBox)(target));
            return;
            case 16:
            this.dishTypeListBox = ((System.Windows.Controls.ListBox)(target));
            return;
            case 17:
            this.dishlistBox = ((System.Windows.Controls.ListBox)(target));
            return;
            case 18:
            this.gridSplitter = ((System.Windows.Controls.GridSplitter)(target));
            return;
            case 19:
            this.textBlock3 = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 20:
            this.button1 = ((System.Windows.Controls.Button)(target));
            return;
            case 21:
            this.button1_Copy = ((System.Windows.Controls.Button)(target));
            
            #line 161 "..\..\..\..\View\OrderWindow.xaml"
            this.button1_Copy.Click += new System.Windows.RoutedEventHandler(this.buttonHisorder_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

