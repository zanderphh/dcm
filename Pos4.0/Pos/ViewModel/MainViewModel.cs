using GalaSoft.MvvmLight;
using Lib;

namespace Pos.ViewModel
{
    public class MainViewModel : ValidationViewModelBase
    {
        private string myVar;

        public string Name
        {
            get { return myVar; }
            set { Set("Name",ref myVar, value, true); }
        }

    }
}