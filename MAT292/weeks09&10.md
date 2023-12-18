<h1>MAT292: Ordinary Differential Equations (Weeks 9-10)</h1>

**5.1 Definition of Laplace Transform**

Let $f$ be a function on $[0, \infty)$. Then the Laplace transform of $f$ is defined as 

$F(s) = \int_0^{\infty}e^{-st}f(t)\,dt$	(1)

*Existence of Laplace Transform*

------

**Theorem 5.1.1**

Suppose that 

1. $f$ is piecewise continuous on the interval $0\leq t\leq A$ for any positive $A$, and 

2. $f$ is of exponential order, i.e. there exist real constants $M\geq 0$, $K\geq 0$, and $a$ such that

   $|f(t)|\leq Ke^{at}$ when $t \geq M$.

Then the Laplace transform $\mathcal{L}\{f(t)\}=F(s)$ exists for $s > a$.

------

*Corollary*: If $f(t)$ satisfies Theorem 5.1.1, then $|F(s)| \leq \frac{L}{s}$ for some constant $L$ as $s \longrightarrow \infty$, which means that $\lim_{0\to\infty}F(s) = 0$.

**5.2 Properties of Laplace Transform**

*Linearity*: The Laplace Transform is linear.

*Uniqueness*: If $\mathcal{L}\{f(t)\} = \mathcal{L}\{g(t)\}$, then $f(t) = g(t)$.

*Multiplying $f$* *by $e^{ct}$ translates $F$ rightward by $c$*: 

If $F(s) = \mathcal{L}\{f(t)\}$ exists for $s > a$, then 

$\mathcal{L}\{e^{ct}f(t)\} = F(s-c)$,	$s > a+c$	(2)

Likewise, multiplying $F$ by $e^{-at}$ results in the multiplication of $f$ shifted $a$ units to the right by the unit step function $u(t - a)$:
$\mathcal{L}^{-1}\{{e^{-as}F(s)}\} = u(t-a)f(t - a)$

![image-20231125145811211](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231125145811211.png)

*Laplace transform of nth derivative yields nth order algebraic equation in $s$*:

$\mathcal{L}\{f^{(n)}(t)\} = s^n\mathcal{L}\{f(t)\} -s^{n-1}f(0) - ... - sf^{n-2}(0)-f^{n-1}(0)$	(3)

*Multiplying $f$ by $t^n$:* If $f$ is piecewise continuous and of exponential order, then

$\mathcal{L}\{t^nf(t)\} = (-1)^nF^{(n)}(s)$,	$s > a$	(4)

![image-20231125160515297](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231125160515297.png)

A corrolary to the above is that for any integer $n \geq 0$, 

$\mathcal{L}\{t^n\} = \frac{n!}{s^{n+1}}$	(5)

**5.3 Inverse Laplace Transform**

The inverse of the Laplace Transform $\mathcal{L}\{f(t)\} = F(s)$ is $f$, if $f$ is piecewise continuous and of exponential order on $[0, \infty)$:

$f = \mathcal{L}^{-1}(F)$

![image-20231125143446728](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231125143446728.png)

The inverse Laplace transform is also linear.

**5.4 Solving Differential Equations with Laplace Transform**

![image-20231128233335647](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231128233335647.png)

*Characteristic Polynomials and Laplace Transforms of Differential Equations*

Consider the general 2nd order linear equation with constant coefficients, 

$ay'' + by' + cy = f(t)$	(6)

with initial conditions prescribed by $y(0) = y_0, y'(0) = y_1$.

The Laplace transform of (6) is

$a[s^2Y(s) - sy(0) -y'(0)] + b[sY(s) - y(0)] + c[Y(s)] = F(s)$	(7)

so separating for $Y(s)$, we find that

$Y(s) = \frac{(as + b)y_0 + ay_1}{as^2 + bs + c} + \frac{F(s)}{as^2 + bs + c}$	(8)

where $F(s)$ is the transform of $f(t)$. Since the characteristic polynomial of (6) appears in the denominator we can see that, if we wish to perform a partial fraction expansion, finding the roots of the characteristic polynomial is still required.

The above pattern extends easily to $n$th order linear equations with constant coefficients:

![image-20231128235715817](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231128235715817.png)

*Laplace Transforms of Systems of Differential Equations*

The Laplace transform method extends easily to systems of equations. Consider the IVP

$y_1' = a_{11}y_1 + a_{12}y_2 + f_1(t),\,\,\, y_1(0) = y_{10}$

$y_2' = a_{21}y_1 + a_{22}y_2 + f_2(t),\,\,\,y_2(0) = y_{20}$	(9)

Taking the Laplace transform of each eqn in (9) gives us

$sY_1 - y_1(0) = a_{11}Y_1 + a_{12}Y_2 + F_1(s)$

$sY_2 - y_2(0) = a_{21}Y_1 + a_{22}Y_2 + F_2(s)$	(10)

The pair of eqns (10) can be rewritten as 

$(s-a_{11})Y_1 - a_{12}Y_2 = y_{10} + F_1(s)$

$-a_{21}Y_1 + (s - a_{22})Y_2 = y_{20} + F_2(s)$	(11)

which can be simplified to matrix form

$(s\textbf{I} - A)\textbf{Y} = \textbf{y}_0 + \textbf{F}(s)$	(12)

where $\textbf{Y} = \begin{pmatrix}Y_1\\Y_2\end{pmatrix}$, $\textbf{A} = \begin{pmatrix} a_{11} & a_{12}\\a_{21} & a_{22}\end{pmatrix}$, $\textbf{y}_0 = \begin{pmatrix}y_{10}\\y_{20}\end{pmatrix}$, $\textbf{F}(s) = \begin{pmatrix}F_1(s)\\F_2(s)\end{pmatrix}$ and $\textbf{I}$ is the 2x2 identity. It follows that

$\textbf{Y} = (s\textbf{I} - \textbf{A})^{-1}\textbf{y}_0 + (s\textbf{I} - \textbf{A})^{-1}\textbf{F}(s)$	(13)

where, using the formula for the inverse of a 2x2 matrix,

$(s\textbf{I} - \textbf{A})^{-1} = \frac{1}{\text{det}(s\textbf{I} - \textbf{A})}\begin{pmatrix} s - a_{22} & a_{12}\\a_{21} & s - a_{11}\end{pmatrix}$

Note that $\text{det}(s\textbf{I} - \textbf{A})$ is the characteristic polynomial of $\textbf{A}$.

**5.5 Discontinuous Functions and Periodic Functions**

Unit step function (Heaviside function):

$u(t) = 0$ if $t <0$, $u(t) = 1$ if $t \geq 0$

Translation of Heaviside Function:

$u_c(t) = 0$ if $t < c$, $u_c(t) = 1$ if $t \geq c$

Indicator function

$u_{cd}(t) = u_c(t) = u_d(t) = 0$ if $t < c$ or $t \geq d$, 

$u_{cd}(t) = u_c(t) = u_d(t) = 1$ if $c \leq t < d$

Multiplying $F$ by $e^{-at}$ results in the multiplication of $f$ shifted $a$ units to the right by the unit step function $u(t - a)$:
$\mathcal{L}^{-1}\{{e^{-as}F(s)}\} = u(t-a)f(t - a)$

![image-20231203191701419](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231203191701419.png)

![image-20231203191738865](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231203191738865.png)

*Periodic Functions*:

If $f$ is periodic with period $T$ and is piecewise continuous on $[0, T]$, then

$\mathcal{L}\{f(t)\} = \frac{\int_0^T e^{-st}f(t)\,dt}{1-e^{-sT}}$

**5.6 Differential Equations with Discontinuous Forcing Functions**

No need for notes



Other notes:

$\mathcal{L}\{ty'\} = -\frac{d}{ds}(\mathcal{L}\{y'\}) =  -sY'(s) - Y(s)$

$\mathcal{L}\{ty''\} = -\frac{d}{ds}(\mathcal{L}\{y''\})   = -s^2Y'(s) -sY(s) + y(0)$