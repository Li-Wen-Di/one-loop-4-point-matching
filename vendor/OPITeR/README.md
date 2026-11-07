# OPITeR : Orbit Partition Improved Tensor Reduction


 A Form procedure for reducing Tensor Feynman integrals 

 Copyright (C) 2024  Jae Goode, Franz Herzog, Sam Teale

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

 
## Files
 
`opiter.frm`

* Contains the main procedures for tensor reduction including:
    * `opiter` procedure that executes the tensor reduction 
    * `symmetrise` expands out the symmetrisers after integration in the integrand symmetry mode is used 

`tenred.prc`

* Contains the procedure that performs tensor reduction using the full basis of projectors 

`tenredisym.prc`

* Contains the procedure that performs tensor reduction exploiting the symmetry of the integrand 

`PrtCanonicalize.prc`

* Contains procedures that put projectors into canonical form in order to be substituted.

`gamma_algebra.h`

* Contains some procedures for dealing with gamma matrices used internally in the `opiter` procedure

`/projectors`

* contains the projectors that `opiter` applies
    * `Prt_table*` are tables with precontracted projectors
    * `projectors_*` are uncontracted projectors 

`/grammatrix/invgram_table*`

* tables that store the elements of inverse gram matrix and its determinate (as the 0,0 elsments) 

`opitersettings.dat`

* This stores several settings that govern how the program runs

## Calling OPITeR

1. Clone or copy the OPITeR repository from <https://bitbucket.org/jaegoode/opiter>
2. Add the following to your preamble 
    ```
    #: IncDir <path to opiter directory>
    #include opiter.frm
     ```
3. Ensure that 
    * your integrand is multiplied by the function `loops(p1,...,pL)` listing all your loop momenta 
   * your integrand is multiplied by the function `ext(q1,...,qE)` listing all your external momenta
   An example input is 
   ```
   L F = ext(q1,q2)*loop(p1,p2)
         *p1(mu1)*p1(mu2)*p2(mu3)*p2(mu4);
   ```
4. Call OPITeR with the command 
    ```
    #call opiter
    ```
5. Perform your integration
6. If you are using the integrand symmetry version of OPITeR you may expand the symmetrisers with the command 
    ```
    #call  symmetrise
    ```
7. If you wish to later transform out of the dual momentum / transverse metric basis you may do with 
    ```
    #call leavedualtransverse
    ```
## Settings
The file `opitersettings.dat` is where the user may specify several options that govern the running of the code 

`tensormode`: Tells OPITeR what method to use in the reduction 

|Value|Effect                                |
|:---:|--------------------------------------|
|`1`  |Reduction without integrand symmetries|
|`2`  |Reduction with integrand symmetries   |

`tensorbasis`: Tells OPITeR what basis to output the answer in  

|Value|Effect                                           |
|:---:|-------------------------------------------------|
|`1`  |dual-transverse basis (`dt_(mu,nu)`,`dual(p,mu)`)|
|`2`  |standard basis (`d_(mu,nu)`,`p(mu)`)             |

To speed up the time it takes to read in files we provide the option for specify the maximum rank of tensor you will use (`MaxN`) and the maximum number of independent external momenta (`MaxE`). `MaxN` may take values up to 20 and `MaxE` values up to 8.


## Input

You're input may additionaly involve the follwing elements 

`gam(line,indices)` : This function defines a string of
gamma matrices using the same convention as Form’s own
`g_`. Alternatively one can use `Gsigma` which denotes a totally antisymmetric product of gamma matrices.

`rat(x,y)` : During the runtime of OPITeR we assign rat to
be the PolyRatFun (polynomial rational function), meaning
that Form will combine and simplify neighbouring rats. More
information on the behaviour of PolyRatFun can be found in
the Form documentation.

`proj(...)` : It may be that your integrand contains a number
of external momenta present only in the numerator. In this
case these momenta can be factored out of the integral, in the form of a projector to be acted on the tensor integral after tensor reduction. This is a typical situation faced when Taylor expanding integrals in external momenta. By feeding this product of external momenta into a proj function OPITeR can exploit the symmetry to make the symmetrise procedure more efficient.

`deno(x)` : Since OPITeR is a tensor reduction routine it does
not care about anything in the denominator of the Feynman
integral being reduced. `deno(x)` is simply a shorthand for
1/x that also protects its contents from any manipulation by
the OPITeR procedure. It will also appear in your output.

## Output

The result of the opiter procedure is a fully tensor-reduced
expression consisting of scalar integrals that can be used in thenext step of your computation. There are some further functions that can appear in the output of the OPITeR procedure:

`dual(qi,index)` : This denotes the dual momentum
corresponding to the external momentum `qi`

`sym(ind1(...)*ind2(...))` : Denotes a symmetriser $\mathcal{S}$ as The two index sets in `ind1` and `ind2`
correspond to the upper and lower set of indices.

`dts, ddts` : Both refer to the transverse metric 

## Reserved symbols
Form’s lack of encapsulation makes it impossible to hide the
symbols we use in our procedures from the end user. We have
endeavoured to use symbols that are not likely to clash with
those in the user’s own programs. However, we reserve the
following symbols for internal use in OPITeR. Use of these
symbols in the rest of your code may cause incorrect behaviour.
The following sets of indices/symbols are reserved for internal
use:
```
set indmuro: muro1,...,muro100; * index
set indmusi: musi1,...,musi100; * index
set indmumu: mumu1,...,mumu100; * index
set indnunu: nunu1,...,nunu100; * index
set indMMu: MMu1,...,MMu30;      * index
set indNNu: NNu1,...,NNu30;      * index

set qqset: qq1,...,qq30; * momenta
set ppset: pp1,...,pp30; * momenta
```

We further reserve the following functions and tensors
```
counter, counter2, counter3, gamind, ind, ind1, ind2, vec, tag, gtr, D3, dt, Prt, gamm, T, TI, sym, symn, H, invDelta, Pr, Prat, FF*
```
Additionally several quantities are reserved as table elements 
```
Prt2,...,Prt20
PrtExplicit2,...,PrtExplicit20
Htable2,...Htable8
```


There are further several quantities that are  not reserved but have been declared in `opiter.frm` so may cause some unexpected behavior due to `AutoDeclare` 

```
Autodeclare Index jj,MMu,NNu,musi,muro,mumu,nunu,mu,nu;
Autodeclare Vector RR,qq,pp,p,Q,q;
Autodeclare Symbol c,invDelta;
Autodeclare CF FF;
```
