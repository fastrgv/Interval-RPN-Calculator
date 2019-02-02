pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package ifGAOL_hpp is

   procedure plus
     (xl : double;
      xr : double;
      yl : double;
      yr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:8
   pragma Import (CPP, plus, "_Z4plusddddRdS_");

   procedure minus
     (xl : double;
      xr : double;
      yl : double;
      yr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:14
   pragma Import (CPP, minus, "_Z5minusddddRdS_");

   procedure times
     (xl : double;
      xr : double;
      yl : double;
      yr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:20
   pragma Import (CPP, times, "_Z5timesddddRdS_");

   procedure divide
     (xl : double;
      xr : double;
      yl : double;
      yr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:26
   pragma Import (CPP, divide, "_Z6divideddddRdS_");

   procedure recip
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:34
   pragma Import (CPP, recip, "_Z5recipddRdS_");

   procedure sqrt
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:35
   pragma Import (CPP, sqrt, "_Z4sqrtddRdS_");

   procedure chs
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:37
   pragma Import (CPP, chs, "_Z3chsddRdS_");

   procedure exp
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:38
   pragma Import (CPP, exp, "_Z3expddRdS_");

   procedure ln
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:40
   pragma Import (CPP, ln, "_Z2lnddRdS_");

   procedure lg
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:41
   pragma Import (CPP, lg, "_Z2lgddRdS_");

   procedure sin
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:43
   pragma Import (CPP, sin, "_Z3sinddRdS_");

   procedure cos
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:44
   pragma Import (CPP, cos, "_Z3cosddRdS_");

   procedure tan
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:45
   pragma Import (CPP, tan, "_Z3tanddRdS_");

   procedure asin
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:47
   pragma Import (CPP, asin, "_Z4asinddRdS_");

   procedure acos
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:48
   pragma Import (CPP, acos, "_Z4acosddRdS_");

   procedure atan
     (xl : double;
      xr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:49
   pragma Import (CPP, atan, "_Z4atanddRdS_");

   procedure pow
     (xl : double;
      xr : double;
      yl : double;
      yr : double;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:52
   pragma Import (CPP, pow, "_Z3powddddRdS_");

  --///// constants ////////////////////
   procedure deg2rad (zl : access double; zr : access double);  -- ifGAOL.hpp:60
   pragma Import (CPP, deg2rad, "_Z7deg2radRdS_");

   procedure rad2deg (zl : access double; zr : access double);  -- ifGAOL.hpp:61
   pragma Import (CPP, rad2deg, "_Z7rad2degRdS_");

   procedure halfpi (zl : access double; zr : access double);  -- ifGAOL.hpp:63
   pragma Import (CPP, halfpi, "_Z6halfpiRdS_");

   procedure onepi (zl : access double; zr : access double);  -- ifGAOL.hpp:64
   pragma Import (CPP, onepi, "_Z5onepiRdS_");

   procedure twopi (zl : access double; zr : access double);  -- ifGAOL.hpp:65
   pragma Import (CPP, twopi, "_Z5twopiRdS_");

  --void zero( double&zl, double&zr );
  --void one( double&zl, double&zr );
  --///////// ...if possible... //////////////
  -- convert user-entered string of chars
  -- into a precise interval
   procedure s2i
     (s : Interfaces.C.Strings.chars_ptr;
      zl : access double;
      zr : access double);  -- ifGAOL.hpp:74
   pragma Import (CPP, s2i, "_Z3s2iPKcRdS1_");

  --note:  this would preclude my having to parse...
end ifGAOL_hpp;
