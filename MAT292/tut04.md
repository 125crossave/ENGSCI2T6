<h3>MAT292 Tutorial #4</h3>

*Today and next week, you will develop and analyze models for an arms race between two countries, where*
*⋅ Time 𝑡 ≥ 0 is given in years.*
*⋅ 𝑥(𝑡) is the annual military budget (in dollars) in year 𝑡 of The Republic of Galbraith (GB).*
*⋅ 𝑦(𝑡) is the annual military budget (in dollars) in year 𝑡 of Bahenia (BA).*
*We want to understand how different strategies will impact these budgets, and to investigate which strategies*
*may be more advantageous for each country.*
1. *Mutual fear. The tensions are growing across the Strait of Saint George. Major Myhal, the commander of the Republic of Galbraith, is constantly being informed by her spies about the military spending of Bahenia. Myhal says: For every dollar that BA is spending, we will*
  *increase our budget by 𝑏 dollars! But Sergeant Sandford, the commander of Bahenia, keeps*
  *himself informed too. Sandford says: We’ll increase our own budget by 𝑐 dollars for every dollar spent by GB!*
  *(a) Explain what the units and the signs of 𝑏 and 𝑐 should be, using your intuition.*

  Positive

  *(b) Without solving anything, what behaviour do you expect in the long run? Why?*

  We expect the budgets of both countries to grow without bound.

  *(c) Write a system that defines this model using a coefficient matrix 𝐴.*

  $\begin{pmatrix} x' \\ y'\end{pmatrix} = \begin{pmatrix} 0 & b \\c & 0\end{pmatrix}\begin{pmatrix}x\\y\end{pmatrix}$

  *(d) Write down the equations you need to solve in order to find equilibrium solutions, and then find all**equilibrium solutions that exist for this system.*

  Equilibria ($\textbf{x' = 0}$) is only possible if $b = 0$ and $y = 0$ or $c = 0$ and $x = 0$ or both 1st and third event or both second and 4th event listed here occur

  *(e) What are the eigenvalues of the matrix 𝐴? What are the corresponding eigenvectors?*

  det$A = 0$ so $(-\lambda)^2 - bc = 0$

  Thus, $\lambda = \pm\sqrt{bc}$

  For $\lambda = \sqrt{bc}$, RREF of $A - \lambda I $ is $\begin{pmatrix}1 & \frac{-b}{\sqrt{bc}}\\0 & 0\end{pmatrix}$

  Let $x_2 = t$, then $x_1 = \frac{bt}{\sqrt{bc}}$. Thus the corresponding eigenvector is $\begin{pmatrix}\frac{b}{\sqrt{bc}}\\1\end{pmatrix}$

  For $\lambda = -\sqrt{bc}$, RREF of $A - \lambda I$ is $\begin{pmatrix} 1 & \frac{b}{\sqrt{bc}}\\0 & 0\end{pmatrix}$

  Let $x_2 = t$, then $x_1 = \frac{-bt}{\sqrt{bc}}$. Thus the corresponding eigenvector is $\begin{pmatrix}\frac{-b}{\sqrt{bc}}\\1\end{pmatrix}$

  *(f) Solve this system.*

  The general solution is $e^{\sqrt{bc}t}\begin{pmatrix}\frac{b}{\sqrt{bc}}\\1\end{pmatrix} + e^{-\sqrt{bc}t}\begin{pmatrix}\frac{-b}{\sqrt{bc}}\\1\end{pmatrix}$

2. **Plotting a phase portrait. Let’s have a look at the phase portrait for the*
  *coefficients 𝑏 = 1 and 𝑐 = 9. Keep in mind that budgets aren’t negative!*
  *(a) Draw the corresponding straight-line solutions for the eigenvectors of the*
  *system. Make sure to indicate the direction on each line.*
  *(b) Draw the system’s direction field.*
  *(c) Sketch a few solutions to complete a phase portrait.*
  (d) What does the model predict about the long term military budgets?* 

​	Both will tend towards infinity: the eigenvector $\begin{pmatrix}\frac{b}{\sqrt{bc}}\\1\end{pmatrix}$ will dominate