#ifndef IFGAOL_HPP
#define IFGAOL_HPP





void plus( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr );


void minus( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr );


void times( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr );


void divide( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr );




void recip( const double xl, const double xr, double &zl, double &zr);
void sqrt( const double xl, const double xr, double &zl, double &zr);

void chs( const double xl, const double xr, double &zl, double &zr);
void exp( const double xl, const double xr, double &zl, double &zr);

void ln( const double xl, const double xr, double &zl, double &zr);
void lg( const double xl, const double xr, double &zl, double &zr);

void sin( const double xl, const double xr, double &zl, double &zr);
void cos( const double xl, const double xr, double &zl, double &zr);
void tan( const double xl, const double xr, double &zl, double &zr);

void asin( const double xl, const double xr, double &zl, double &zr);
void acos( const double xl, const double xr, double &zl, double &zr);
void atan( const double xl, const double xr, double &zl, double &zr);


void pow( 
	const double xl, const double xr, 
	const double yl, const double yr, 
	double &zl, double &zr );


/////// constants ////////////////////

void deg2rad( double&zl, double&zr );
void rad2deg( double&zl, double&zr );

void halfpi( double&zl, double&zr );
void onepi( double&zl, double&zr );
void twopi( double&zl, double&zr );

//void zero( double&zl, double&zr );
//void one( double&zl, double&zr );

/////////// ...if possible... //////////////

// convert user-entered string of chars
// into a precise interval
void s2i( const char * s, double&zl, double&zr );

//note:  this would preclude my having to parse...

#endif

