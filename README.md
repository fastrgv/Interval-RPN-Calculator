![screenshot](https://github.com/fastrgv/Interval-RPN-Calculator/blob/master/irpn.png)


Here is a 7z archive that includes all the newest source and executables for Windows, Linux, & OSX:

https://github.com/fastrgv/Interval-RPN-Calculator/releases/download/v2.1.0/irpn13aug24.7z


* On OSX, Keka works well for 7Z files. The command-line for Keka is:
	* /Applications/Keka.app/Contents/MacOS/Keka --cli 7z x (filename.7z)




### Note: Please ignore the "Source code" zip & tar.gz files. (They are auto-generated by GitHub). Click on the large 7z file under releases to download all source & binaries (Windows,Mac & Linux). Then, type "7z x filename" to extract the archive. 







# Interval RPN Calculator


## Whats new:



**ver 2.1.1 -- 1jan2025**

* Checked my HP calculator & found the power operator was Ok in ver 2.0.9. Fixed.
* Header now clarifies that x=stack(top), y=stack(next).
* Replaced "lg" with "log2" for extra clarity.



**ver 2.1.0 -- 13aug2024**

* Arguments were reversed for the power-operator (^). That is now corrected.
* Fixed header to clarify that y=stack(2), x=stack(1).


**ver 2.0.9 -- 15oct2023**

* Added guard to memory slots 0..9;
* More refinements to input handling.


**ver 2.0.8 -- 14oct2023**

* Important corrections to input handling.
* Added reciprocal function using the (i)-btn.

## More change-history at end of file


## Brief Description

This is a terminal calculator with the enhancement of 
interval output.  So along with your answer, you get 
a good idea of its trustworthiness.

It mimics the functionality of an Hewlett-Packard Reverse
Polish Notation [RPN] calculator, simply because I like RPN.
But along with your answer, you get some measure of its 
trustworthiness.

Runs on PCs or laptops running Windows, OSX, or GNU/Linux.  

-----------------------------------------------------------
Featuring

	* no installation
	* no dependencies
	* simply unzip in any directory, and run;
	* or unzip onto a USB flash drive and run.
-----------------------------------------------------------


## Details

Here is the header that appears on invocation:
	
---------------- Interval RPN calculator ---------------

           BinOp{+-*/^} => Y:stack[next] (Op) X:stack[top]
Key Map:

             <z>=>{clr}      <n>=>{CHS}      <k>=>{stack}

             <x>=>{X:Y}      <m#>=>{STO}     <M#>=>{RCL}

             <p>=>{pi}       <E>=>{e^x}      <^>=>{y^x}

             <s>=>{sin}      <c>=>{cos}      <t>=>{tan}

             <S>=>{asin}     <C>=>{acos}     <T>=>{atan}

             <D>=>{Deg}      <R>=>{Rad}*     <l>=>{ln}

             <r>=>{sqrt}     <h>=>{help}     <i>=>{1/x} 

             <L>={log2}      <q>=>{quit}

### HP notations
For those who never used an HP calculator, here is further explanation:

	clr   => Clear All
	chs   => Change Sign of stack top
	stack => display contents of stack
	x:y   => swap top two stack entrys
	log2  => log base 2

	sto   => store data into memory 0..9
				Eg: m5 pops top element off the stack into memory #5

	rcl   => recall from a memory 0..9
				Eg: M5 pushes data in memory #5 onto stack top


### Operation
Type numbers and hit (enter) to push each of them onto the RPN stack.  Then a single key defines the desired operation.

RPN means that you enter the numbers first, then define the operation.  A unary operator, like sin, will apply the function to the number at the top of the numeric stack, then push the result back on the stack top.  A binary operator will pop two values off the stack, then perform the operation on them, and push the result back on the stack top.

For those familiar with the HP RPN calculators, the number entry here differs slightly.  To enter scientific notation you simply type the number as you would normally, eg "1.3e5" or "1.3e-6" followed by the (enter)-key. The (n)-key will negate the value at the stack top. (i.e.: typing "-1.3e-6" is not allowed)
 

In order that math OPs only require a single keystroke
**a unary minus is not allowed**
The (n)-key will negate the value at the stack top. 
(i.e.: typing "-1.3e-6" is not allowed)

The allowed binary operators are {plus,minus,times,divide,pow}.  These are invoked with the usual keyboard keys (^ is pow).

The (h)-key [Help] will always show the menu.


### Memory Function (mk/Mk, k=0..9):

Enter a number, then type m3 + (enter), to store it in memory #3 location.  This will pop it off the stack.

Recall it by typing M3 + (enter);  this puts it on top of stack, while retaining it in memory location #3.



#### Example output [ ln(1.3e-6) ]:

	1.3e-6

	1.300_000_000_000_000_000E-06 HI

	1.299_999_999_999_999_840E-06 LO    [ stack.top: 1 ]

	l  LN 

	-13.553_146_293_496_780_800 HI

	-13.553_146_293_496_785_600 LO    [ stack.top: 1 ]





## Mini Thin Binding to Boost Intervals

Ada developers note that this app includes a minimal Ada-binding to the Boost Interval C++ library.  But, more importantly, it demonstrates the methodology so you can expand the binding to include access to other functionality, as needed.

## Setup & Running:
The application's root directory [~/intRpn/] contains files for deployment on 3 platforms:  1)OS-X, 2)linux, 3)Windows, in addition to all the source code. This app is completely self contained and will run without installing any third party software onto your system.

Unzip the archive.

* On Linux & Windows, 7z [www.7-zip.org] works well for this. The proper command to extract the archive and maintain the directory structure is "7z x filename".

* On OSX, Keka works well. The command-line for Keka works thusly:
	* /Applications/Keka.app/Contents/MacOS/Keka --cli 7z x (filename.7z)

After the archive is unzipped...

Open a commandline terminal, and cd to the install directory.

To initiate, type:

	"irpn.bat" on Windows
	"irpn_gnu" on Linux
	"irpn_osx" on Mac/OSX



-------------------------------------------------------------------
The h-key (Help/Hint) will show the menu.

Remember that a unary minus is not allowed
Use the n-key to CHS [ChangeSign(negate) the stack top].


--------------------------------------------------------------------------

## Rebuild Instructions

This app should run as delivered, but if you wish to build it yourself 
you must install the boost libs. The scripts below assume:
	a) osx,linux: BOOST_ROOT = $HOME/Downloads/boost_1_78_0
	b) Windows: BOOST_ROOT=%HOMEPATH%\Downloads\boost_1_74_0
...so you need to modify the scripts according to
your boost home directory.


**Windows** => wcmp.bat

**GNU/Linux** => lcmp.sh

**Mac/OSX** => ocmp.sh


## TBD

Crashes due to bad input keystrokes are still possible.  Needs to improve.
If you want to help fix these, send me a script so I can reproduce your problem.


=======================================================================
Open source Ada developers are welcome to help improve or extend this app.
Developer or not, send comments, suggestions or questions to:
fastrgv@gmail.com


=======================================================================
IntervalRPN is covered by the GNU GPL v3 as indicated in the sources:

 Copyright (C) 2025  fastrgv@gmail.com

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You may read the full text of the GNU General Public License
 at <http://www.gnu.org/licenses/>.


## Older Change History------------------------------------------------
=======================================================================

**ver 2.0.7 -- 12oct2023**
* More improvements in input handling.
* Correction to menu.

**ver 2.0.6 -- 7oct23**
* Revised & improved build scripts.
* Updated Mac OSX build.
* Improved input handling to better allow [bs]-key or [del]-key to correct bad input.

**ver 2.0.5 -- 28sep22**
* All build scripts now avoid creating a library-file first.
* Elliminated w32 build.
* Now using new easy to install GNU ada for Win64.

**ver 2.0.4 -- 16sep22**
* Now use GNU Ada exclusively.
* Elliminated use of defunct AdaCore compiler.

**ver 2.0.3 -- 8jan22**
* Improved coding, interface & help screen.
* Reduced clutter in root directory.

**ver 2.0.2 -- 12oct20**
* Improved output format; added (h)-key.
* Improved handling of erroneous inputs.

**ver 2.0.1 -- 9oct20**
* Improved coding of ifjail.cpp for better accuracy.
* Improved number entry in irpn.adb for proper accuracy.

**ver 2.0.0 -- 7oct20**
* Converted to using Boost-Interval library. (Boost NOT needed to run).
* Now works for Windows, OSX, & most distros of linux.
* FIRST VERSION USING BOOST-INTERVAL LIBRARY.

**ver 1.1.0 -- 3feb20**
* Big improvement in linux portability.  Now runs on a redhat-derived linux distro, as well as Mint, a Debian-derivative.
* FINAL VERSION USING GAOL BY FREDERIC GOUALARD

**ver 1.0.2 -- 27feb19**
.) updated to newer mathlib (linux);
.) improved & simplified output formats;

**ver 1.0.1 -- 5feb19**
.) added some exception handling;
.) added help (h), and show stack (k);
.) output now grouped in 3s;

**ver 1.0.0 -- 3feb19**
.) initial release


