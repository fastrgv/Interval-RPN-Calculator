
with ifgaol_hpp;
with mathtypes;

with interfaces.c;
with interfaces.c.strings;

with ada.characters.handling;  use ada.characters.handling;
with ada.characters.latin_1;

with text_io; use text_io;



procedure irpn is 

	use mathtypes;
	use interfaces.c;

	package math renames mathtypes.math_lib;
	use math;


	package myreal_io is new text_io.float_io(real);


	type optype is 
	(data,  -- indicator of numerical, non-operator token
	 plus, minus, times, divide, power,
	 sin,    cos,    tan,  ln, log2,
	 aSin,   aCos, aTan, Exp, sqRt, recip
	 );

	type intervaltype is
		record
			lf, rt : aliased real := 0.0;
		end record;

	type tokentype is 
		record 
			op: optype; 
			val: intervaltype;
		end record;

	maxstack : integer := 99;
	type stacktype is array(0..maxstack) of tokentype;
	stack : stacktype;
	top : integer := 0; -- next available position

	--global numerical accumulators:
	num : intervaltype;
	expnum : real := 0.0;
	frac : real := 1.0;
	numpending, degmode : boolean := false;


	savtop, savnex : intervaltype;
	ch,ch2: character;
	last: natural;
	instr: string(1..80);
	val: integer;

	subtype linerange is integer range 1..80; --0..79;
	type linetype is array(linerange) of character;
	inchars : linetype;
	len,this  : linerange := 1;

	uistring: string(linerange);

	mem : array(0..9) of intervaltype;



	procedure myassert( 
		condition : boolean;  
		flag: integer:=0;
		msg: string := ""
		) is
	begin
	  if condition=false then
			put("ASSERTION Failed!  ");
			if flag /= 0 then
				put( "@ " & integer'image(flag) &" : " );
			end if;
			put_line(msg);
			new_line;
			raise program_error;
	  end if;
	end myassert;





-- resets all numerical accumulators:
procedure reset is
begin
	frac:=1.0;
	num.lf:=0.0; num.rt:=0.0;  expnum:=0.0;
	numpending:=false;
end reset;

-- assemble a number when ready:
procedure update( inStr: string ) is
	cstr: interfaces.c.strings.chars_ptr := 
		interfaces.c.strings.new_string(inStr);
begin
	ifgaol_hpp.s2i(cstr, num.lf'access, num.rt'access);
end update;



procedure push( op: optype; inputStr: string := "" ) is
	toosmall : constant real := 1.0e-1;
	toolarge : constant real := 1.0e4;
	avg,del: real;
begin

--put_line("push str=|"&inputStr&"|");
--put_line("pushed: "&real'image(num.lf));

	if( ((op=data) and numpending) or (op/=data) ) then

		if( op = data ) and (inputStr/="") then
			update(inputStr); -- sets num
		end if;


		if( top < maxstack ) then
			stack(top).op := op;
			stack(top).val := num;
			top := top+1; --points to next available space

			if( op = data ) then

				avg:=0.5*(num.lf+num.rt);
				del:=0.5*(num.rt-num.lf); 

				if(abs(avg)<toosmall)or(abs(avg)>toolarge) then
					myreal_io.put(num.rt,2,16,3); put("HI");
					new_line;

					myreal_io.put(num.lf,2,16,3); put("LO");
					new_line;

					myreal_io.put(avg,2,16,3); put("AV ");
					put(" "); myreal_io.put(del,2,2,3); put(" Er");

				else
					myreal_io.put(num.rt,2,16,0); put("HI");
					new_line;

					myreal_io.put(num.lf,2,16,0); put("LO");
					new_line;

					myreal_io.put(avg,2,16,0); put("AV ");
					put(" "); myreal_io.put(del,2,2,3); put(" Er");

				end if;

				put_line("    [ stack.top:"&integer'image(top)&" ]");

			else
				put(" "&optype'image(op)&" ");
				new_line;
			end if;

			--reset accumulators, numpending:=false
			reset;

		end if;

	end if;

end push;


--procedure pop( lf, rt : out real ) is
procedure pop( ival : out intervaltype ) is
begin
	if( top=0 ) then
	put_line("error: popping empty stack");
	else
	top:=top-1;
	end if;

	if( stack(top).op /= data ) then
	put_line("error in pop val");
	get_line(instr,last);
	put_line("aborting");
	raise program_error;
	end if;

	ival := stack(top).val;

end pop;


function pop return optype is
begin
	if( top=0 ) then
	put_line("error in pop op: popping empty stack");
	get_line(instr,last);
	put_line("aborting");
	raise program_error;
	end if;
	top:=top-1;
	if( stack(top).op = data ) then
	put_line("error in pop op");
	get_line(instr,last);
	put_line("aborting");
	raise program_error;
	end if;
	return stack(top).op;
end pop;




procedure applyOp is
left, right : intervaltype;
op : optype;
--nint, ninv : integer;
--integral, oddinv, intinv, odd : boolean;

d2r,r2d, ln2 : intervaltype;

	two: interfaces.c.strings.chars_ptr := 
		interfaces.c.strings.new_string("2.0");

begin

ifgaol_hpp.deg2rad(d2r.lf'access,d2r.rt'access);
ifgaol_hpp.rad2deg(r2d.lf'access,r2d.rt'access);

op := pop;
pop(right);

case op is

when plus =>
	pop(left);
	ifgaol_hpp.plus(left.lf,left.rt,right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when minus =>
	pop(left);
	ifgaol_hpp.minus(left.lf,left.rt,right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when times =>
	pop(left);
	ifgaol_hpp.times(left.lf,left.rt,right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when divide =>
	pop(left);
	ifgaol_hpp.divide(left.lf,left.rt,right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when power =>

	pop(left);
	ifgaol_hpp.pow(left.lf,left.rt,right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

	--all the rest only require 1 argument


when recip =>
	ifgaol_hpp.recip(right.lf, right.rt, num.lf'access, num.rt'access);

	numpending:=true;
	push( data );

when sqrt =>

	ifgaol_hpp.sqrt(right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );
when sin =>
	if degmode then --convert right to radians
		ifgaol_hpp.times(d2r.lf,d2r.rt, right.lf,right.rt, left.lf'access,left.rt'access);
		right:=left;
	end if;
	ifgaol_hpp.sin(right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when cos =>

	if degmode then --convert right to radians
		ifgaol_hpp.times(d2r.lf,d2r.rt, right.lf,right.rt, left.lf'access,left.rt'access);
		right:=left;
	end if;
	ifgaol_hpp.cos(right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when tan =>

	if degmode then --convert right to radians
		ifgaol_hpp.times(d2r.lf,d2r.rt, right.lf,right.rt, left.lf'access,left.rt'access);
		right:=left;
	end if;
	ifgaol_hpp.tan(right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when asin =>

	ifgaol_hpp.asin(right.lf,right.rt, num.lf'access,num.rt'access);
	if degmode then --convert num to degrees
		right:=num;
		ifgaol_hpp.times(r2d.lf,r2d.rt, right.lf,right.rt, num.lf'access,num.rt'access);
	end if;

	numpending:=true;
	push( data );

when acos =>

	ifgaol_hpp.acos(right.lf,right.rt, num.lf'access,num.rt'access);
	if degmode then --convert num to degrees
		right:=num;
		ifgaol_hpp.times(r2d.lf,r2d.rt, right.lf,right.rt, num.lf'access,num.rt'access);
	end if;

	numpending:=true;
	push( data );

when atan =>

	ifgaol_hpp.atan(right.lf,right.rt, num.lf'access,num.rt'access);
	if degmode then --convert num to degrees
		right:=num;
		ifgaol_hpp.times(r2d.lf,r2d.rt, right.lf,right.rt, num.lf'access,num.rt'access);
	end if;

	numpending:=true;
	push( data );

when exp =>

	ifgaol_hpp.exp(right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when ln =>
	ifgaol_hpp.ln(right.lf,right.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when log2 =>

	ifgaol_hpp.s2i(two,ln2.lf'access,ln2.rt'access); --lg(x)=ln(x)/ln(2)

	ifgaol_hpp.ln(right.lf,right.rt, num.lf'access,num.rt'access);
	left:=num;
	ifgaol_hpp.divide(left.lf,left.rt, ln2.lf, ln2.rt, num.lf'access,num.rt'access);

	numpending:=true;
	push( data );

when others =>
	put_line("error in applyOp");
	get_line(instr,last);
	put_line("aborting");
	raise program_error;
end case;

end applyOp;


procedure get_token( inpchars: in out linetype; len: in out linerange ) is
	ch,ch2: character;
	ord : positive_count;
	stop : boolean := false;
	bch: character := Ada.Characters.Latin_1.BS;
	dch: character := Ada.Characters.Latin_1.DEL;
begin

	len:=1;
	loop
		get_immediate(ch); --gets keybd input as typed
		ord := character'pos(ch);

		if(ord=127)or(ord=8) then -- <del> or <bs>
			if(len>1) then
				len:=len-1;
				put(bch);
			end if;
		else

			inpchars(len):=ch;
			if(ord/=13)and(ord/=10)and(ord/=27) then
				put( ch );
			end if;

			stop := (ch in 'A'..'Z')or(ch in 'a'..'z')
				or(ord=43)or(ord=45) -- + -
				or(ord=42)or(ord=47) -- * /
				or(ord=94)           -- ^
				or(ord=27)           -- <esc>
				or(ord=10)or(ord=13); --<ret>

			if len>1 and ch='e'  then 
				stop:=false; -- part of a number
			end if;
			if len>1 and ch='-' then
				stop:=false; -- part of a number
			end if;

			if( (ch = 'm') or (ch = 'M') ) then
				-- still need to get memory # 0..9
				get_immediate(ch2);
				put(ch2);
				len:=len+1;
				inpchars(len):=ch2;
			end if;

			exit when stop;
			len:=len+1;

		end if;

	end loop;

	if
	(ord=10)or(ord=13)or(ord=43)or(ord=45)or
	(ord=42)or(ord=47)or(ord=94)or
	(ch in 'A'..'Z') or 
	((ch in 'a'..'z') and (ch /= 'n') )
	then
		new_line;
	end if;


end get_token;



procedure menu is
begin
new_line;
put_line("---------------- Interval RPN calculator ---------------");
new_line;
put_line("Key Map:");
put_line("            <esc>=>{quit}    <z>=>{clr}      <n>=>{CHS}");
put_line("             <e>=>{EEX}      <E>=>{e^x}      <^>=>{x^y}");
put_line("             <s>=>{sin}      <c>=>{cos}      <t>=>{tan}");
put_line("             <S>=>{asin}     <C>=>{acos}     <T>=>{atan}");
put_line("             <l>=>{ln}       <p>=>{pi}       <r>=>{sqrt}");
put_line("             <L>=>{lg}       <D>=>{Deg}      <R>=>{Rad}*");
put_line("             <x>=>{X:Y}      <m>=>{STO}      <M>=>{RCL}");
new_line;
end menu;



begin --irpn(main)----------------------------------------------

menu;

outer:
loop

get_token(inchars, len);
this:=1;

--uistring := string( inchars(1..len) );
uistring := string(inchars);



inner: 
loop

	ch := inchars(this);

	if( is_digit(ch) ) then
		val:=character'pos(ch) - character'pos('0');
	end if;

	case ch is

		when '+' =>

			if len<=1 then
				push( plus );
				applyOp;
			end if;

		when '-' =>

			if len<=1 then
				push( minus );
				applyOp;
			end if;

		when '*' =>
			push( times );
			applyOp;

		when '/' =>
			push( divide );
			applyOp;

		when '^' =>
			push( power );
			applyOp;

		when 'r' =>
			push( sqrt );
			applyOp;

		when 's' =>
			push( sin );
			applyOp;

		when 'c' =>
			push( cos );
			applyOp;

		when 't' =>
			push( tan );
			applyOp;

		when 'S' =>
			push( asin );
			applyOp;

		when 'C' =>
			push( acos );
			applyOp;

		when 'T' =>
			push( atan );
			applyOp;

		when 'E' =>
			push( exp );
			applyOp;

		when 'l' =>
			push( ln );
			applyOp;

		when 'L' =>
			push( log2 );
			applyOp;



		when 'p' => --pi
			reset;

			ifgaol_hpp.onepi(num.lf'access,num.rt'access);
			numpending:=true;
			push( data );


		when 'n' => -- change sign (Negate) NOW ONLY APPLIES TO STACKTOP

myassert(not numpending, 5, "logic @ 585 when n");
			if not numpending then
				pop(num); --added 31jan19
				numpending:=true; --negate stackTop
			end if;

			ifgaol_hpp.chs(num.lf,num.rt, num.lf'access, num.rt'access);
			--WARNING:  this might not work

			push( data );

		when '0'..'9' =>
			numpending:=true;

		when '.' | 'e' => --added 1feb19
			numpending:=true;

		when 'q'|'Q' =>  -- quit
			exit outer; --loop (quit gracefully)

		when 'D' => -- deg
			degmode:=true;
			put_line(" Degree mode");

		when 'R' => -- rad
			degmode:=false;
			put_line(" Radian mode");

		when 'x' => -- x:y (swap)

			pop( savtop );
			pop( savnex );

			num.lf:=savtop.lf;  num.rt:=savtop.rt;
				numpending:=true; push(data);

			num.lf:=savnex.lf;  num.rt:=savnex.rt;
				numpending:=true; push(data);

		when 'z' => -- clear
			reset;
			top:=0;
			put_line(" Clear All");

		when 'm' =>  -- STO logic
			this:=this+1;
			ch2:=inchars(this);
			reset;
			if( is_digit(ch2) and (top>0) ) then
			val:=character'pos(ch2) - character'pos('0');
			pop( savtop );
			mem(val):=savtop;
			put     (" stored Memory # "&integer'image(val));
			put_line("    [ stack.top:"&integer'image(top)&" ]");
			else
			put(inchars(1));
			--raise program_error;
			put_line(" STO fail");
			end if;

		when 'M' =>  -- RCL logic
			this:=this+1;
			ch2:=inchars(this);
			if( is_digit(ch2) ) then
			val:=character'pos(ch2) - character'pos('0');
			num:=mem(val); numpending:=true; push(data);
			else
			put(inchars(1));
			--raise program_error;
			put_line(" RCL fail");
			end if;


		when others =>

			if
			( character'pos(ch) = 13 ) or
			( character'pos(ch) = 10 ) -- unix/linux <enter>
			then -- <enter>

				if numpending then
				push( data, uistring(1..len) );
				end if;


			elsif( character'pos(ch) = 27 ) then --<esc> => exit
				exit outer; --loop (quit program gracefully)

			else -- quit

				put("  Msg: unhandled character: |"); put(ch); put_line("|");
				put_line( "char'pos="&integer'image( character'pos(ch) ) );
				put_line(" Showing Menu:");
				--get_line(instr,last);
				--put_line("aborting");
				--raise program_error;
				menu;

			end if;

	end case;

	exit inner when (this=len);
	this:=this+1;

end loop inner;

end loop outer;

end irpn;

