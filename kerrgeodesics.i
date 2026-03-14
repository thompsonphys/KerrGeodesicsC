%module kerrgeodesics

%{
#include "korb.h"
%}

/* ── ignore functions that use double complex, function pointers, or void* ── */

/* double complex return values (Fourier integrands) */
// %ignore korb_Trint;
// %ignore korb_Tthint;
// %ignore korb_Print;
// %ignore korb_Pthint;
// %ignore korb_dchidlaint;
// %ignore korb_dpsidlaint;

/* function-pointer / advanced spectral routines */
%ignore korb_specint;
%ignore korb_dft;
%ignore korb_dct;
%ignore korb_getamps;

/* GSL root-finding callbacks (void *params) */
%ignore korb_rmf;
%ignore korb_rmdf;
%ignore korb_rmfdf;

/* ── ignore pointer members of korb_params (Fourier coefficient arrays) ── */
%ignore korb_params::dladpsiamps;
%ignore korb_params::dladchiamps;
%ignore korb_params::dpsidlaamps;
%ignore korb_params::dchidlaamps;
%ignore korb_params::Tramps;
%ignore korb_params::Tthamps;
%ignore korb_params::Pramps;
%ignore korb_params::Pthamps;

/* ── tell SWIG's parser to skip C99 _Complex ── */
#define complex

/* ── parse the header ── */
%include "korb.h"
