<h1>ECE286: Probability & Statistics (Weeks 1 & 2)</h1>

**2.1: Sample Space**

**Defn:** The set of all possible outcomes in a statistical experiment is called the *sample space* and is denoted by $S$.

*$Ex 2.1.1$*: Flip a coin, and then flip it a second time if you get heads. If you get tails, then roll a die. The sample space of outcomes is $\{HT, HH, T1, T2, T3, T4, T5, T6\}$

![image-20240107140808375](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20240107140808375.png)

*$Ex 2.1.2$*: Flip a coin until you get heads, then the sample space is $\{H, TH, TTH, TTTH, ...\}$

**2.2 Events**

**Defn:** An *event* is a subset of a sample space.

$Ex 2.2.1$: If $S = \{t | t \geq 0\}$, where $t$ is life in years of a certain electronic component, then event $A$ that the component fails before the end of the fifth year is $A = \{t|0\leq t\leq 5\}$

Events may comprise the entire sample space or (**defn:**) the *empty set* ($\emptyset$), which is a member of every sample space and is the set containing no members.

$Ex 2.2.2$: Let event $B = \{x|x\text{is an even factor of 7}\}$. Then $B = \emptyset$.

**Defn:** The *complement* of an event $A$ wrt $S$ is the event containing all elements of $S$ not in $A$. Denote $A^c$.

$Ex 2.2.3$: Let $R$ be the event that a red card is drawn from an ordinary deck of 52 playing cards. Then $R^c$ is the event that a black card is drawn from this deck of cards.

**Defn:** The *intersection* of events $A$ and $B$  (Denoted $A \cap B$) is the event containing all elements common to both $A$ and $B$.

**Defn:** Two events $A$ and $B$ are mutually exclusive, i.e. *disjoint*, if they have no members in common.

**Defn:** The *union* of $A$ and $B$ is the event containing all elements in $A$, $B$, or both $A$ and $B$.

![image-20240107145701545](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20240107145701545.png)

**2.3 Counting Sample Points**

**Thm:** If an operation can be performed in $n_1$ ways, and a second operation can be performed for each of these ways in $n_2$ ways, then the two operations can be performed together in $n_1n_2$ ways.

$Ex 2.3.1$: There are 6*6 = 36 possible outcomes when two dice are rolled.

$Ex2.3.2$: If a club has 22 members and needs to elect a chair and a treasurer who is a different person than the chair, there are 22*(22-1) = 462 different ways of electing the chair and treasurer.

**Thm:** A sequence of $k$ operations with $n_1$ ways for the 1st operation,  $n_2$ ways for the 2nd operation, and so on up to $n_k$ ways for the $k$th operation, can be performed in $n_1n_2...n_k$ ways.

$Ex2.3.3$: How many even four digit numbers can be constructed from the digits 0, 1, 2, 5, 6, and 9 if each digit can only be used once?

- Ans: We cannot have the first digit be 0. Split into two separate events, one ($A$) where last digit is 0 and one ($B$)where last digit is not 0. Then 5 * 4 * 3 * 1 = 60 number of members in $A$ and 4 * 4 * 3 *2 = 96 in $B$ (4 for the thousands digit and not 5 because we can't have 0 in that spot) . Since the events are disjoint we may add them to obtain the total number of even four digit numbers given the possibilities: 60 + 96 = 156

**Defn:** A *permutation* is an arrangement of all or part of a set of objects.

**Thm: **The number of permutations of $n$ distinct objects is $n!$

**Thm:** The number of permutations of $n$ distinct objects taken $r$ at a time is $_nP_r = \frac{n!}{(n-r)!}$

$Ex2.3.4$: If 3 awards can be given to 25 students, and each student can receive a maximum of one award, then the number of different ways in which awards can be given to students is $\frac{25!}{(25-3)!} = 25*24*23 = 13800$

$Ex2.3.5:$ A club of 50 students has 2 positions; president and treasurer; how  many different choices of officers are possible if (a) there are no restrictions; (b) A will serve only if he is president; (c) B and C will serve together or not at all; (d) D and E will not serve together?

- a): 50!/48! = 2450
- b) Pretend A doesnt exist: (49)(48). THen add this number to the possible number cases where A serves as president to get the total: 49(48) + 49 = 2401
- c) Pretend B & C don't exist: 48!/46!. Then add this number to the possible number of cases where B and C serve together to get the total: 48!/46! + 2 = 2258
- d) Pretend D & E will serve together: 50!/48!. Then subtract the possible number of cases where D and E serve together to get the total: 50!/48! - 2 = 2448

**Thm:** The number of distinct permutations of $n$ things of which $n_1$ are of one kind, $n_2$ of another, ..., $n_k$ of a $k$th kind is $\frac{n!}{n_1!n_2!...n_k!}$

$Ex 2.3.6$: Football practice, 10 players, 4 juniors, 3 seniors, 2 sophomore, 1 freshman, how many ways arrange if they are only distinguished by class level?

- Ans: $\frac{10!}{4!3!2!1!} = 12600$

**Thm:** The number of ways of partioning $n$ objects into $r$ cells with $n_1$ elements in the first cell, $n_2$ in the second, ..., $n_r$ in the $r$th, where $\sum_{i = 1}^r n_i = n$, is $\frac{n!}{n_1!n_2!...n_r!} = \binom{n}{n_1,n_2,...,n_r}$ which we call the *multinomial coefficient*.

$Ex2.3.7$: How many ways to divide 7 people in a hotel into 1 triple and 2 double rooms?

- Ans: $\frac{7!}{3!2!2!} = 210$

**Thm:** The number of combinations of $n$ distinct objects taken $r$ at a time is $\binom{n}{r} = \frac{n!}{r!(n-r)!}$. Note that the notation $\binom{n}{r}$, called the *binomial coefficient*, is actually shorthand for $\binom{n}{r,n-r}$. Also note we call these *combinations* since we have the original permutations through $\frac{n!}{(n-r)!}$, but don't care about order meaning we must divide by $r!$ to account for uniqueness of different combinations

$Ex2.3.8$: A kid wants his mom to choose 5 games from his collection of 10 arcade and 5 sports games, how many ways can his mom get 3 arcade and 2 sports games?

- Ans: For arcade, $\frac{10!}{3!(10-3)!} = 120$, for sports, $\frac{5!}{2!(5-2)!} = 10$, and multiplying these using first thm in this section we get $120*10 = 1200$ ways.

$Ex2.3.9$: How many diff. letter arrangements can be made from the word $STATISTICS$?

- Ans: there are 3 $S$, 3 $T$, 1 $A$, 2 $I$, 1 $C$, and 10 letters in total, so $\frac{10!}{3!3!1!2!1!} = 50400$

**2.4 Probabilities of Events**

**Defn:** The probability of an event $A$ is the sum of the weights of all sample points in $A$; thus $0 \leq P(A) \leq 1$, $P(\emptyset) = 0$, $P(S) = 1$. Further, if $A_1, A_2, A_3, ...$ a sequence of mutually exclusive events, then $P(A_1)\cup P(A_2)\cup P(A_3) + ... = P(A_1) + P(A_2) + P(A_3) + ...$

**Rule:** If an experiment can result in any one of $N$ different equally likely outcomes, and if exactly $n$ of these outcomes correspond to event $A$, then $P(A) = \frac{n}{N}$

$Ex 2.4.1$: In a hand consisting of 5 cards, probability of 2 aces and 3 jacks?

- Ans: Total number of ways of being dealt 2 aces from 4 aces in total is $\frac{4!}{2!(4-2)!} - 6$, total number of ways of being dealt 3 jacks from 4 jacks in total is $\frac{4!}{3!{4-3)!}} = 4$, so the total # of ways of being dealt 2 aces and 3 jacks is $6*4 = 24$. In total, there are $\frac{52!}{5!(52-5)!} = 2598960$ ways of being dealt 5 cards, so the probability is $\frac{24}{2598960}$.

**2.5 Additive Rules**

**Thm:** If $A$, $B$ are two events then $P(A\cup B) = P(A) + P(B) - P(A\cap B)$.

- Proof: When adding $P(A) + P(B)$ one adds $P(A\cap B)$ twice, so to account for this one must subtract $P(A \cap B)$ once in order to obtain $P(A\cup B)$ 

![image-20240122214632020](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20240122214632020.png)

**Corollary:** If $A, B$ mutually exclusive, then $P(A\cup B) = P(A) + P(B)$.

**Corollary:** If $A_1, A_2, ..., A_n$ mutually exclusive, then $P(A_1 \cup A_2 \cup ... \cup A_n) = P(A_1) + P(A_2) + ... + P(A_n)$.

**Corollary:** If $A_1, ..., A_n$ is a partition of sample space $S$, then $P(A_1 \cup A_2 \cup ... \cup A_n) = P(A_1) + P(A_2) + ... + P(A_n) = P(S) = 1$.

**Thm:** For 3 events $A$, $B$, $C$, $P(A\cup B\cup C) = P(A) + P(B) + P(C) - P(A\cap B) - P(B\cap C) - P(A\cap C) + P(A\cap B \cap C)$

**Thm:** If $A$, $A'$ are complementary events, then $P(A) + P(A') = 1$. 

- Proof: Since $A\cup A' = S$ and the sets $A, A'$ are disjoint, $1 = P(S) = P(A\cup A') = P(A) + P(A')$.

**2.6 Conditional Probability, Independence, and the Product Rule**

**Defn:** The conditional probability of $B$, given $A$, denoted $P(B|A)$, is defined as $P(B|A)  = \frac{P(A\cap B)}{P(A)}$ (provided $P(A) > 0$).

**Defn:** Two events $A$ and $B$ are *independent* iff $P(A|B) = P(A)$ or $P(B|A) = P(B)$. Otherwise, $A$ and $B$ are *dependent.*

**Thm:** If in an experiment two events $A$ and $B$ can both occur, then $P(A\cap B) = P(B|A)P(A)$, provided $P(A) > 0$.

**Thm:** Two events $A$ and $B$ are independent iff $P(A\cap B) = P(A)P(B)$.

**Thm:** If in an experiment, events $A_1, A_2, ..., A_k$ can occur, then $P(A_1 \cap A_2 \cap ... \cap A_k) = P(A)P(A_2|A_1)P(A_3|A_1\cap A_2)...P(A_k|A_1\cap A_2 \cap ... \cap A_{k-1})$

**2.7 Bayes' Rule**

**Thm (Total Probability/Rule of Elimination):** If events $B_1, B_2, ..., B_k$ constitute a partition of the sample space $S$ s.t. $P(B_i) \neq 0$ for $i \in \{1, 2, ..., k\}$, then for any event $A$ in $S$, $P(A) = \sum_{i = 1}^kP(B_i \cap A) = \sum_{i = 1}^kP(B_i)P(A|B_i)$

![image-20240127155348818](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20240127155348818.png)

**Thm (Bayes' Rule):** If events $B_1, B_2, ..., B_k$ constitute a partition of the sample space $S$ s.t. $P(B_i) \neq 0$ for $i \in \{1, 2, ..., k\}$, then for any event $A$ in $S$ s.t. $P(A) \neq 0$, $P(B_r|A) = \frac{P(B_r\cap A)}{\sum_{i = 1}^kP(B_i\cap A)} = \frac{P(B_r)P(A|B_r)}{\sum_{i = 1}^kP(B_i)P(A|B_i)}$ for $r \in \{1, 2, ..., k\}$.

- *Proof:* Follows from applying law of total probability.

**3.1 Concept of a Random Variable**

**Defn:** A random variable is function which associates each element in the sample space with a real number.

**Defn:** A bernoulli random variable is one chosen which assigns either 1 or 0 to each element in the sample space. 

**Defn:** If a sample space contains a finite number of possibilities or an unending sequence with as many elements as there are whole numbers, then it is called a *discrete* sample space.

**Defn:** If a sample space contains an infinite number of possivilities equal to the number of points on a line segment, then it is called a *continuous sample space*.

**Defn:** A *continuous* random variable is one whose can take on outcomes on a continuous scale. A RV that takes on a countable number of outcomes is *discrete RV*

**3.2 Discrete Probability Distributions**

**Defn:** The set of ordered pairs $(x, f(x))$ is a *probability fcn* (*probability distribution*) of the discrete random variable $X$ if, for each possible outcome $x$, 

1. $f(x) \geq 0$,
2. $\sum_xf(x) = 1$,
3. $P(X =x)= f(x)$.

**Defn:** The *cumulative distribution function* $F(x)$ of a discrete random variable $X$ with probability distrubtuion $f(x)$ is $F(x) = P(X \leq x) = \sum_{t \leq x}f(t)$, for $-\infty < x < \infty$.

**3.3 Continuous Probability Distributions**

**Defn:** The function $f(x)$ is a *probabilty density fcn (pdf)* for the continuous random variable $X$, defined over the set of real numbers, if

1. $f(x) \geq 0$, for all $x \in\textbf{R}$
2. $\int_{-\infty}^{\infty}f(x)dx = 1$
3. $P(a<X<b) = \int_a^bf(x)dx$

**Defn:** The *cumulative distribution fcn (cdf)* $F(x)$ of a continuous random variable $X$ with density function $f(x)$ is $F(x) = P(X \leq x) = \int_{-\infty}^xf(t)dt$, for $-\infty < x < \infty$.

**3.4 Joint Probability Distributions**

**Defn:** The fcn $f(x,y)$ is a *joint probability distrutbion* or *joint probability mass fcn (pmf)* of the discrete random variables $X$ and $Y$ if

1. $f(x,y)\geq 0$ for all $(x,y)$,
2. $\sum_x\sum_yf(x,y) = 1$,
3. $P(X = x, Y = y) = f(x,y)$

- For any region $A$ in the $xy$-plane, $P[(X,y)\in A] = \sum\sum_Af(x,y)$.

**Defn:** The fcn $f(x,y)$ is a *joint density fcn* of the continuous random variables $X$ and $Y$ if

1. $f(x,y) \geq 0$ for all $(x, y)$,
2. $\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}f(x,y)dxdy = 1$
3. $P[(X,Y)\in A] = \int\int_Af(x,y)dxdy$ for any region $A$ in the $xy$-plane

**Defn:** The *marginal distributions* of $X$ alone and of $Y$ alone are $g(x) = \sum_yf(x,y)$ and $h(y) = \sum_x f(x,y)$ for the discrete case, and $g(x) = \int_{-\infty}^{\infty}f(x,y)dy$ and $h(y) = \int_{-\infty}^{\infty}f(x,y)dx$ for the continuous case.

**Defn:** The *conditional distribution* of the RV $Y$ given that $X = x$ is $f(y|x) = \frac{f(x,y)}{g(x)}$ provided $g(x) > 0$. Similarly, the conditional distribution of $X$ given that $Y = y$ is $f(x|y) = \frac{f(x,y)}{h(y)}$ provided $h(y) > 0$.

**Defn:** Let $X, Y$ be two RVs, discrete or continuous, with joint probability distribution $f(x,y)$ and marginal distributions $g(x)$ and $h(y)$ respectively. The RVs $X$ and $Y$ are said to be *statistically independent* iff $f(x,y) = g(x)h(y)$ for all $(x,y)$ within their range.