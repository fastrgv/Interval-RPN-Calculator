
Here is a 7z archives that includes all source and libraries:

https://github.com/fastrgv/Interval-RPN-Calculator/releases/download/v1.0.0/irpn3feb19.7z



# Interval RPN Calculator

**ver 1.0.0 -- 3feb19**

## Brief Description
This terminal app runs on PCs or laptops running OSX or GNU/Linux.  It attempts to mimic the functionality of an HP ReversePolishNotation [RPN] calculator with the added enhancement of interval output.  So along with your answer, you get a good idea of its trustworthiness.


## Details



Here is the header that appears on invocation:
	
---------------- Interval RPN calculator ---------------

Key Map:

            <esc>=>{quit}    <z>=>{clr}      <n>=>{CHS}
            
             <e>=>{EEX}      <E>=>{e^x}      <^>=>{x^y}
             
             <s>=>{sin}      <c>=>{cos}      <t>=>{tan}
             
             <S>=>{asin}     <C>=>{acos}     <T>=>{atan}
             
             <l>=>{ln}       <p>=>{pi}       <r>=>{sqrt}
             
             <L>=>{lg}       <D>=>{Deg}      <R>=>{Rad}
             
             <x>=>{X:Y}      <m>=>{STO}      <M>=>{RCL}



### Operation
Type numbers and hit (enter)-key to push each of them onto the RPN stack.  Then a single key defines the desired operation.

RPN means that you enter the numbers first, then define the operation.  A unary operator, like sin, will apply the function to the number at the top of the numeric stack, then push the result back on the stack top.  A binary operator will pop two values off the stack, then perform the operation on them, and push the result back on the stack top.

For those familiar with the HP RPN calculators, the number entry here differs.  To enter scientific notation you simply type the number as you would normally, eg "1.3e5" or "1.3e-6" followed by the (enter)-key.  The (n)-key will negate the value at the stack top.

The allowed binary operators are {plus,minus,times,divide,pow}.  These are invoked with the usual keyboard keys.

#### Example screen output [ ln(1.3e-6) ]:

1.3e-6

 1.3000000000000000E-06HI
 
 1.2999999999999998E-06LO
 
 1.2999999999999998E-06AV     [ stack.top: 1 ]
 
l

 LN 
 
-13.5531462934967808HI

-13.5531462934967840LO

-13.5531462934967824AV     [ stack.top: 1 ]



## GAOL by Frédéric Goualard [GNU LPGL] <Frederic.Goualard@univ-nantes.fr> 

This app uses GAOL, a C++ library to perform arithmetic with floating-point intervals.

It is hoped that this calculator will help to familiarize the curious with some of GAOL's incredible capabilities.  Of course, GAOL can be used in countless ways.  This app is a mere demonstration.

GAOL requires either IBM APMathlib, or CRlibm floating-point arithmetic libraries.



## Setup & Running:
The application's root directory [~/intRpn/] contains files for deployment on 2 platforms:  1)OS-X, 2)linux, in addition to all the source code.

Unzip the archive.

Open a commandline terminal, and cd to the install directory.

Linux users should type "irpn_gnu".

Mac users type "irpn_osx".

The install_directory should contain a subdirectory named "libs".  The expectation is that this app is completely self contained and should run without installing third party libraries on your system.

--------------------------------------------------------------------------

## Rebuild Instructions

This app should run as delivered, but the tools to rebuild are included, also.

**MacOSX** => ocmp.sh
**GNU/Linux** => lcmp.sh

There are also interface libraries that should not need rebuilding, but if you try...
Note that the directory ~/intRpn/adabinding/ contains scripts to rebuild the interface libraries:
	libifgaol.so (linux), libifgaol.dylib (osx)
however, the dylib needs to be subsequently modified with the script "fixlib.sh", it you attempt to rebuild these libraries yourself.

Finally, if my prebuilt GAOL libraries for linux do not work on your flavor of linux, you would need to build GAOL for yourself (and modify the compiler scripts).  Here is the website:  

http://frederic.goualard.net/

I am fairly confident that my prebuilt GAOL library for OSX will work.  If I'm wrong, reference the above website.


## Solicitation:
Help me to get this working on M.S. Windows too!

=======================================================================
IntervalRPN is covered by the GNU GPL v3 as indicated in the sources:

 Copyright (C) 2019  fastrgv@gmail.com

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

