// <copyright file="PexAssemblyInfo.cs">Copyright ©  2016</copyright>
using Microsoft.Pex.Framework.Coverage;
using Microsoft.Pex.Framework.Creatable;
using Microsoft.Pex.Framework.Instrumentation;
using Microsoft.Pex.Framework.Settings;
using Microsoft.Pex.Framework.Validation;

// Microsoft.Pex.Framework.Settings
[assembly: PexAssemblySettings(TestFramework = "VisualStudioUnitTest")]

// Microsoft.Pex.Framework.Instrumentation
[assembly: PexAssemblyUnderTest("Pos")]
[assembly: PexInstrumentAssembly("Microsoft.Practices.ServiceLocation")]
[assembly: PexInstrumentAssembly("Utils")]
[assembly: PexInstrumentAssembly("System.Web")]
[assembly: PexInstrumentAssembly("GalaSoft.MvvmLight.Extras")]
[assembly: PexInstrumentAssembly("GalaSoft.MvvmLight.Platform")]
[assembly: PexInstrumentAssembly("PresentationCore")]
[assembly: PexInstrumentAssembly("WindowsBase")]
[assembly: PexInstrumentAssembly("PresentationFramework")]
[assembly: PexInstrumentAssembly("System.Data")]
[assembly: PexInstrumentAssembly("System.Xaml")]
[assembly: PexInstrumentAssembly("System.Data.DataSetExtensions")]

// Microsoft.Pex.Framework.Creatable
[assembly: PexCreatableFactoryForDelegates]

// Microsoft.Pex.Framework.Validation
[assembly: PexAllowedContractRequiresFailureAtTypeUnderTestSurface]
[assembly: PexAllowedXmlDocumentedException]

// Microsoft.Pex.Framework.Coverage
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "Microsoft.Practices.ServiceLocation")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "Utils")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Web")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "GalaSoft.MvvmLight.Extras")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "GalaSoft.MvvmLight.Platform")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "PresentationCore")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "WindowsBase")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "PresentationFramework")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Data")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Xaml")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Data.DataSetExtensions")]

