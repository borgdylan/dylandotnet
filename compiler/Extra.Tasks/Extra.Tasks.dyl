#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

import System
import System.IO
import System.Collections
import System.Collections.Generic
import System.Linq
import System.Xml
import System.Xml.Linq
import System.Text.RegularExpressions
import Microsoft.Build.Tasks
import Microsoft.Build.Framework
import Microsoft.Build.Utilities
import dylan.NET.Utils
import dylan.NET.Compiler
import dylan.NET.ResProc

#include "ErrorWarnTask.dyl"
#include "DncTask.dyl"
#include "ResProcTask.dyl"
#include "FindResProcOuts.dyl"

//#warning "This is an warning"
//#error "This is an error"