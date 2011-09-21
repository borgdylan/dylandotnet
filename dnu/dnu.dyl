#refasm mscorlib.dll
#refasm System.dll
#refasm System.Core.dll
#refasm System.Data.dll
#refasm System.Data.DataSetExtensions.dll
#refasm System.Xml.dll
#refasm System.Xml.Linq.dll
#refasm System.Configuration.dll
#refasm Microsoft.VisualBasic.dll
#refasm System.Windows.Forms.dll

import Microsoft.VisualBasic
import System
import System.Collections
import System.Collections.Generic
import System.Data
import System.Diagnostics
import System.Linq
import System.Xml
import System.Xml.Linq
import Microsoft.VisualBasic.CompilerServices
import Microsoft.VisualBasic.FileIO
import System.Xml.XPath
import System.Windows.Forms
import System.Runtime.InteropServices
import System.Text.RegularExpressions

locimport dylan.NET.Utils
locimport dylan.NET

assembly dnu dll
ver 11.2.7.5

namespace dylan.NET.Utils
#include E:\Code\dylannet\dnu\dnu\consts.dyl
#include E:\Code\dylannet\dnu\dnu\xmlu.dyl
#include E:\Code\dylannet\dnu\dnu\parseu.dyl
// #include E:\Code\dylannet\dnu\dnu\winapi.txt
end namespace