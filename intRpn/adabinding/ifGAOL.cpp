#include "ifGAOL.hpp"


#include <string>
using std::string;

#include <iostream>
using std::cout;
using std::endl;

#include <gaol/gaol.h>

//////////////////////////////////////////////////////////////////



void deg2rad( double&zl, double&zr )
{
	interval z;
	interval d("180.0");

	z=pi/d;

	zl=z.left();
	zr=z.right();
}

void rad2deg( double&zl, double&zr )
{
	interval z;
	interval d("180.0");

	z=d/pi;

	zl=z.left();
	zr=z.right();
}





void sqrt( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=sqrt(x);

	zl=z.left();
	zr=z.right();
}

void recip( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=interval::one()/x;

	zl=z.left();
	zr=z.right();
}









void plus( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr )
{
	interval x(xl,xr);
	interval y(yl,yr);
	interval z = x+y;

	zl=z.left();
	zr=z.right();
}



void minus( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr )
{
	interval x(xl,xr);
	interval y(yl,yr);
	interval z = x-y;

	zl=z.left();
	zr=z.right();
}




void times( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr )
{
	interval x(xl,xr);
	interval y(yl,yr);
	interval z = x*y;

	zl=z.left();
	zr=z.right();
}




void divide( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr )
{
	interval x(xl,xr);
	interval y(yl,yr);
	interval z = x/y;

	zl=z.left();
	zr=z.right();
}


//////////////////////////////////////////////////////////////////

void s2i( const char * s, double&zl, double&zr )
{
	string str(s);
	interval z(s);
	zl=z.left();
	zr=z.right();
}

void pow( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr )
{
	interval x(xl,xr);
	interval y(yl,yr);
	interval z = pow(x,y);

	zl=z.left();
	zr=z.right();
}




void onepi( double&zl, double&zr )
{
	interval z(pi);
	zl=z.left();
	zr=z.right();
}


void twopi( double&zl, double&zr )
{
	interval z=two_pi;
	zl=z.left();
	zr=z.right();
}


void halfpi( double&zl, double&zr )
{
	interval z=half_pi;
	zl=z.left();
	zr=z.right();
}

/*
void zero( double&zl, double&zr )
{
	interval z=interval::zero();
	zl=z.left();
	zr=z.right();
}


void one( double&zl, double&zr )
{
	interval z=interval::one();
	zl=z.left();
	zr=z.right();
}
*/
//////////////////////////////////////////////////////


void chs( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z= -x;

	zl=z.left();
	zr=z.right();
}


void exp( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=exp(x);

	zl=z.left();
	zr=z.right();
}


void ln( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=log(x);

	zl=z.left();
	zr=z.right();
}


void lg( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);
	interval two("2.0");

	z=log(x)/log(two);

	zl=z.left();
	zr=z.right();
}


void sin( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=sin(x);

	zl=z.left();
	zr=z.right();
}


void cos( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=cos(x);

	zl=z.left();
	zr=z.right();
}


void tan( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=tan(x);

	zl=z.left();
	zr=z.right();
}


void asin( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=asin(x);

	zl=z.left();
	zr=z.right();
}


void acos( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=acos(x);

	zl=z.left();
	zr=z.right();
}


void atan( const double xl, const double xr, double &zl, double &zr)
{
	interval z;
	interval x(xl,xr);

	z=atan(x);

	zl=z.left();
	zr=z.right();
}




