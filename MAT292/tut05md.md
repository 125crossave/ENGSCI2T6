<h3>MAT292 Tutorial #5</h3>

1. *Mutual fear. Let’s recall what things looked like in the model you developed last week.*

*(a) Write a system that defines this model using a coefficient matrix 𝐴.*

*$\begin{pmatrix} x' \\ y'\end{pmatrix} = \begin{pmatrix} 0 & b \\c & 0\end{pmatrix}\begin{pmatrix}x\\y\end{pmatrix}$*

*(b) Identify all equilibrium solutions.*

  *Equilibria ($\textbf{x' = 0}$) is only possible if $b = 0$ and $y = 0$ or $c = 0$ and $x = 0$ or both 1st and third event or both second and 4th event listed here occur*

*(c) Draw a rough sketch of the phase portrait, including straight-line solutions*

2. *The Richardson Model. The illegal arms dealers in the Bay of Bahen are having a feast. But both Major*

*Myhal and Sergeant Sandford are facing pressure from local politics, with two effects on mutual fear:*

***I***

*THe bigger a country’s military budget, the more the political leaders push to reduce spending.*
*⋅ GB now also decreases its budget by 𝒂 dollars annually for every dollar already in its own budget.*
*⋅ BA now also decreases its budget by 𝒅 dollars annually for every dollar already in its own budget.*

***II*** 

*Long-term grievances between the two countries leads some other politicians to push for a fixed an-*
*nual budget increase. This increase always happens, independent of how much each country spends.*
*⋅ GB now also increases its budget by 𝜷 dollars annually.*
*⋅ BA now also increases its budget by 𝜹 dollars annually.*



*(a) Write the system that defines this new model. Your system will involve a matrix. For the rest of the*
*question you can assume that this matrix is invertible.*

$\begin{pmatrix} x' \\ y'\end{pmatrix} = \begin{pmatrix} -a & b \\c & -d\end{pmatrix}\begin{pmatrix}x\\y\end{pmatrix} + \begin{pmatrix}\beta\\\delta\end{pmatrix}$

*(b) At what points does a solution (𝑥(𝑡), 𝑦(𝑡)) satisfy the condition 𝑥 ̈(𝑡) = 0? We call the line of such*
*points 𝐿𝑥 . What does it look like?*

$L_x: y = \frac{ax-\beta}{b}, x = \frac{by + \beta}{a}$

*(c) What will the direction field look like at points in 𝐿𝑥 ?*
*(d) Repeat parts (b) and (c), this time for the condition 𝑦 ̈(𝑡) = 0. We call the resulting set 𝐿𝑦 .*

$L_y: y = \frac{cx + \delta}{d}, x = \frac{dy - \delta}{c}$

*(e) The two lines 𝐿𝑥 and 𝐿𝑦 intersect in one point. What is the meaning of that point?*

It is the equilibrium solution

*(f) Use the equations for 𝐿𝑥 and 𝐿𝑦 to find an equation for the intersection of 𝐿𝑥 and 𝐿𝑦* 

$y = \frac{\beta c + \delta a}{ad - bc}$

$x = \frac{\delta b + \beta b}{ad - bc}$



3. *Tricky bonus: Analyzing asymptotic behaviour. The Richardson model can afford new insight into*

*the tendencies and the long-term consequences of these military budget strategies. We already know how* *to study asymptotic behaviour by analyzing the straight-line solutions. In this question, however, we will**instead look at 𝐿𝑥 and 𝐿𝑦 which are called the optimal lines for 𝑥 and 𝑦.*
*(a) Show that 𝑥(𝑡) will always move towards 𝐿𝑥 .*

From our system of equations we have $\frac{dy}{dt} = cx - dy + \delta$. Applying the integrating factors method to solve this we get $y = \frac{cx}{d} - c + \delta + \frac{K}{e^{dx}}$ where $K$= constant as the general solution. Note that $L_y$ is $y = \frac{cx + \delta}{d}$ so we can see that as $x$ -> $\infty$ the $\frac{cx}{d}$ term will dominate and the general solution we obtained will move increasingly closer to $L_y$.

*(b) Show that 𝑦(𝑡) will always move towards 𝐿𝑦 .*

From our system of equations we have $\frac{dy}{dx} = cx - dy + \delta$. Applying the integrating factors method to solve this we get $y = \frac{cx}{d} - c + \delta + \frac{K}{e^{dx}}$ where $K$= constant as the general solution. Note that $L_y$ is $y = \frac{cx + \delta}{d}$ so we can see that as $x$ -> $\infty$ the $\frac{cx}{d}$ term will dominate and the general solution we obtained will move increasingly closer to $L_y$.

*For the remaining parts, just a reminder that all coefficients 𝑎, 𝑏, 𝑐, 𝑑, 𝛽, and 𝛿 are positive.*

*(c) Call the intersection point of the two lines 𝐸. Why can it only lie in the first or third quadrant?*

One of the lines has positive y-intercept and positive slope, the other has negative y-intercept and positive slope; thus it is impossible for the intersection to lie in the second or fourth quadrant. Since the determinant of $A$ is invertible the two lines must intersect, and thus they can only do so in the first or third

*(d) Can you find a simple condition on the values of (some of the) the constants 𝑎, 𝑏, 𝑐, 𝑑, 𝛽, and 𝛿 that
decides if 𝐸 lies in the first or the third quadrant?*



*(e) There is a big difference between how the solutions behave if 𝐸 is in the first versus the third quadrant.
What is it?
(f) Sketch a direction field for the two different cases from the previous part.
(g) What does our model tell us about the longterm outcomes of this scenario and about the short-term
tendencies of the strategies employed by GB and BA?*