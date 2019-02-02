
with interfaces.c;
with ada.numerics.generic_elementary_functions;


package mathtypes is

	--type real is new interfaces.c.double;
	subtype real is interfaces.c.double;

	package math_lib is new 
		ada.numerics.generic_elementary_functions(real);

end mathtypes;

