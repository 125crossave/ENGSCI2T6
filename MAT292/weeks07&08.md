<h1>MAT292: Ordinary Differential Equations (Weeks 7-8)</h1>

**4.2: Theory of Second Order Homogenous Equations **

*Existence and Uniqueness*

Let $y'' + p(t)y' + g(t) = 0, y_0 = a$ then the solution is unique if $p(t), g(t)$ are continuous in an interval about $a$. 

------

**4.3 Linear Homogenous Equations with Constant Coefficients**

This section focuses on the problem of finding a fundamental set of solutions to 

$ay'' + by' + c = 0$ 	(1)

where $a, b, c$ are real numbers. Using the state variables $x_1 = y, x_2 = y'$, we obtain the system

$\textbf{x}' = \begin{pmatrix}0 & 1\\\frac{-c}{a} & \frac{-b}{a}\end{pmatrix}\textbf{x}$	(2)

We can find a fundamental set of solutions using the  eigenvalue method from Section 3.3-3.5.

*The characteristic equation of $ay'' + by' + c = 0$*

$\begin{pmatrix}-\lambda & 1\\\frac{-c}{a} & \frac{-b}{a} - \lambda\end{pmatrix}\begin{pmatrix}v_1\\v_2\end{pmatrix} = \textbf{0}$

Taking the determinant, we find that the eigenvalues are the roots of the polynomial $a\lambda^2 + b\lambda + c = 0$. If this is the case, then 

i) $y = e^{\lambda t}$ is a solution of (1), 

ii) $\lambda$ is an eigenvalue of the coefficient matrix $\textbf{A}$ and the vector function $\textbf{x} = \begin{pmatrix}e^{\lambda t}\\\lambda e^{\lambda t}\end{pmatrix}$ is a solution of (2).

There will be three forms of the general solution of (2) and hence (1):

*Case 1: Distinct real roots*

If $b^2 - 4ac  > 0$, then the roots are real and distinct, i.e. $\lambda_1 \neq \lambda_2$.

Since the eigenvectors corresponding to $\lambda_1$ and $\lambda_2$ are $\textbf{v}_1 = \begin{pmatrix}1\\\lambda_1\end{pmatrix}$ and $\textbf{v}_2 = \begin{pmatrix}1\\\lambda_2\end{pmatrix}$, the general solution of (2) is

$\textbf{x} = \begin{pmatrix}y\\y'\end{pmatrix} = c_1e^{\lambda_1 t}\begin{pmatrix}1\\\lambda_1\end{pmatrix} + c_2e^{\lambda_2 t}\begin{pmatrix}1\\\lambda_2\end{pmatrix}$	(3)

and the general solution of (1) is

$y = c_1e^{\lambda_1 t} + c_2e^{\lambda_2 t}$	(4)

*Case 2: Repeated Roots*

If $b^2 - 4ac  = 0$, then the roots are real and equal i.e. $\lambda_1 = \lambda_2$.

The general solution of (2) is 

$\textbf{x} = \begin{pmatrix}y\\y'\end{pmatrix} = c_1e^{\lambda_1 t}\begin{pmatrix}1\\\lambda_1\end{pmatrix} + c_2e^{\lambda_1 t}\begin{pmatrix}1\\1 + \lambda_1 t\end{pmatrix}$	(5)

and the general solution of (1) is

$y = c_1e^{\lambda_1 t} + c_2te^{\lambda_1 t}$	(6)

*Case 3: Complex Conjugate Roots*

If $b^2 - 4ac < 0$, then the roots are complex conjugates, i.e. $\lambda_1 = \mu + iv$, $\lambda_2 = \mu - iv$

The general solution of (2) is

$\textbf{x} = \begin{pmatrix}y\\y'\end{pmatrix} = c_1e^{\mu t}\begin{pmatrix}\cos vt\\\mu\cos vt - v\sin vt\end{pmatrix} + c_2e^{\mu t}\begin{pmatrix}\sin vt\\ \mu\sin vt + v\cos v t\end{pmatrix}$	(7)

and the general solution of (1) is

$y = c_1e^{\mu t}\cos vt + c_2 e^{\mu t}\sin vt$

![image-20231027185219903](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231027185219903.png)

------

**4.5: Nonhomogeneous Equations; Method of Undetermined Coefficients**

Now we return to the nonhomogeneous equation

$L[y] = y'' + p(t)y' + q(t) = g(t)$.	(8)

The homogenous equation

$L[y] = y'' + p(t)y' + q(t) = 0$	(9)

corresponding to (8) is relevant via the following theorems.

------

***Theorem 4.5.1***

Let $Y_1, Y_2$ be two solutions to (8); then their difference $Y_1 - Y_2$ is a solution of the corresponding homogenous equation (9). If, in addition, $y_1, y_2$ form a fundamental set of solutions to (9), then 

$Y_1 - Y_2 = c_1y_1 - c2y_2$	(10)

where $c_1, c_2$ are constants.

*Proof:* Since $L[Y_1] - L[Y_2] = g(t) - g(t) = 0$, it follows that $L[Y_1 - Y_2] = 0$, i.e. $Y_1 - Y_2$ solves (9).

------

***Theorem 4.5.2***

The general solution of (8) can be written as

$y = \phi(t) = c_1y_1(t) +c_2y_2(t) + Y(t)$	(11)

where $y_1, y_2$ form a fundamental set of solutions to the corresponding homogenous equation (9) and $Y(t)$ is a particular solution of the nonhomogenous equation (8).

*Proof*: If we let $Y_1$ be an arbitrary $\phi$ that solves (8) and $Y_2$ with the particular solution $Y$, then from (10) we have that

$\phi - Y = c_1y_1 + c_2y_2$	(12)

which is equivalent to (11). SInce $\phi$ is arbitrary the expression on the RHS of (11) includes all solutions of (8); hence, it is the general solution to (8).

------

*General Solution Strategy*

Theorem 4.5.2 says we must do three things to solve the nonhomogenous equation (8):

1. Find the general solution to the corresponding homogenous equation (9). This is frequently claled the **complementary solution** and can be denoted as $y_c$
2. Find some single solution to (9); this is the **particular solution** $y_p$.
3. Add the two functions together.

In the remainder of this section, we discuss how to find $y_p$ through a special method known as the *method of undetermined coefficients*.

*Method of undetermined coefficients*

$ay'' + by' + cy = g(t)$	(13)

Where $a, b, c$ are constant.

Steps:

1. Find the general solution of the corresponding homogeneous equation.

2. Make sure that the function g(t) in Eq. (13) involves nothing more than exponential functions, sines, cosines, polynomials, or sums or products of such functions. If this is not the case, use the method of variation of parameters (discussed in Section 4.7).

3. If $g(t) = g_1(t) + g_2(t) + ... + g_n(t)$, i.e. $g$ is a sum of $n$ terms, then form $n$ subproblems each of which only contains one of the terms $g_1, ... g_n$. The $i$th subproblem consists of $ay'' + by' + cy = g_i(t)$ where $i$ runs from 1 to n.

4. Depending on $g_i$ (i.e. whether it is polynomial, exponential, or trigonometric), consult the table. f. If there is any duplication in the assumed form of Yi(t) with the solutions of the homogeneous equation (found in Step 1), then multiply Yi(t) by t, or (if necessary) by t 2, so as to remove the duplication. See Table 4.5.1.

   ![image-20231116011921065](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231116011921065.png)

5. Find a particular solution $Y_i$ for each of the sub-problems. Then their sum $Y_1 + ... + Y_n$ is a particular solution of the full non-homogenous equation (13).

6. Add the general solution of the homogenous equation (Step 1) to the particular solution of the nonhomogenous equation (Step 5). This is the general solution of the nonhomogenous equation (13).

7. If given initial conditions, use those to determine the values of the arbitrary constants remaining in the general solution.

------

**4.7 Variation of Parameters**

For second order ODEs, we can convert $y'' +p(t)y' + q(t)y = g(t)$ to the first order systerm

$\textbf{x}' = \begin{pmatrix}0 & 1\\-q(t) &-p(t)\end{pmatrix}\textbf{x} + \begin{pmatrix}0\\g(t)\end{pmatrix}$	(14)

using the tranfsormation $\textbf{x} = \begin{pmatrix}x_1\\x_2\end{pmatrix} = \begin{pmatrix}y\\y'\end{pmatrix}$. For convenience let the 2x2 matrix be $\textbf{P}$ and the column vector containing $g$ be $\textbf{g}$.

If $[y_1, y_2]$ is a fundamental set of solutions to $y'' +p(t)y' + q(t)y = 0$, then $\textbf{x}_1 = \begin{pmatrix}y_1\\y_1'\end{pmatrix}$ and $\textbf{x}_2 = \begin{pmatrix}y_2\\y_2'\end{pmatrix}$ are a fundamental set of solutions for the homogenous system of equations obtained from (14) by setting $g(t) = 0$. The general solution to the homogenous equation is then

$\textbf{x} = c_1\textbf{x}_1 + c_2\textbf{x}_2$	(15)

and the idea behind the *variation of parameters* is to let $c_1$ and $c_2$ vary, i.e. to let them become functions $u_1(t)$ and $u_2(t)$ so that 

$\textbf{x} = u_1(t)\textbf{x}_1 + u_2(t) \textbf{x}_2 = \textbf{X}\textbf{u}$	(16) 

where $\textbf{X}$ is the **fundamental matrix** $(\textbf{x}_1, \textbf{x}_2)$ whose derivative $\textbf{X}' = \textbf{PX}$ and $\textbf{u} = \begin{pmatrix}u_1\\u_2\end{pmatrix}$. Substituting the right hand side of (16) into (14) yields $\textbf{Xu}' + \textbf{X}'\textbf{u} = \textbf{PXu} + \textbf{g}$ which simplifies to

$\textbf{Xu}' = \textbf{g}$	(17)

Since $\textbf{X}^{-1}$ must exist as a result of $\text{det}\textbf{X} = W[\textbf{x}_1, \textbf{x}_2] \neq 0$, and is given by

$\textbf{X}^{-1} = \frac{1}{W[x_1, x_2]}\begin{pmatrix}x_{22} & -x_{12}\\-x_{21} & x_{11}\end{pmatrix}$	(18)

(17) can be expressed as

$\textbf{u}' = \textbf{X}^{-1}\textbf{g}$	(19)

and integrating both sides we obtain

$\textbf{u} = \int\textbf{X}^{-1}\textbf{g}\,dt +\textbf{c}= \begin{pmatrix}\frac{x_{22}g_1 - x_{12}g_2}{W[\textbf{x}_1, \textbf{x}_2]} \,dt + c_1\\\frac{x_{11}g_1 - x_{21}g_2}{W[\textbf{x}_1, \textbf{x}_2]} \,dt + c_2\end{pmatrix}$	(20)

Substituting for $\textbf{u}$ in (16) yields

$\textbf{x} = \textbf{Xc} + \textbf{X}\int\textbf{X}^{-1}\textbf{g}\,dt$	(21)

and since $\textbf{c}$ is arbitrary, any initial point $t_0$ can be satisfied by an appropriate choice of $\textbf{c}$. Therefore all possible solutions to (14) are covered by (21) and so (21) is the general solution to (14).

The above results are summarized by the following theorem.

------

*Theorem 4.7.1*

Assume that the entries of $\textbf{P} and \textbf{g}$ in (14) are continuous on an open interval $I$ and that $\textbf{x}_1, \textbf{x}_2$ are a fundamental set of solutions of the homogenous system corresponding to (14). Then a particular solution of (14) is 

$\textbf{x}_p = \textbf{X}\int\textbf{X}^{-1}\textbf{g}\,dt$	(22)

and the general solution of (14) is given by

$\textbf{x} = c_1\textbf{x}_1 + c_2\textbf{x}_2 + \textbf{x}_p$	(23)

------

![image-20231122190032256](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231122190032256.png)

Theorem 4.7.1 can be applied generally to all second order ODEs via the following theorem.

------

*Theorem 4.7.2*

If the functions $p, q, g$ are continuous on an open interval $I$ and the functions $y_1, y_2$ are solutions to the homogenous $y'' + py' + qy = 0$ corresponding to the nonhomogenous $y'' + py' + qy = g$, then a particular solution to the nonhomogenous ODE is 

$Y(t) = -y_1(t) \int \frac{y_2(t)g_2(t)}{W[y1, y2] (t)}\,dt + y_2(t)\int \frac{y_1(t)g(t)}{W[y_1, y_2] (t)}\,dt$	(24)

and the general solution is $y = c_1y_1 + c_2y_2 + Y$.

------

![image-20231122190002050](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231122190002050.png)
