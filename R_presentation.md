Categorical Data Analysis
========================================================
author: Hiroki Matsui
css: R_presentation.css
date: 2015/1/21  



�͂��߂�
======================================================
- ���̃v���[���e�[�V�����͌l�̌����ŗL��A�����Ȃ鏊���g�D�̌��������ł͂���܂���B
- ���̎w�E�����}���܂��B�ł���΁A�\�t�g�ɕ\�����Ă��炦��ƃ��`�x�[�V������������܂���B

���ȏЉ�
======================================================
- Matsui Hiroki �i�q�o�s�C�l�o�g�j
- �o�g�F���i��
- ���F���n�r���e�[�V�����A�Տ��u�w�E��Ìo�ϊw
- �����w�Ö@�m�����݂͑�w����  

- �X�L���F��K�͊ώ@�f�[�^�̃n���h�����O�����v���
- �����F��Â�Outcome Research


�{�����b������e
=======================================================
- Categorical Outcome in Rheumatoid Arthritis (1min)
- Categorical Outcome �̉�́i�P�ϗʁj (6min)
- Categorical Outcome �̉�́i���ϗʁj (8min)
- ���ӎ��� (10min)
- �Q�l���� (-min)

�{�����b������e
=======================================================
- Categorical Outcome in Rheumatoid Arthritis (1min) ��
- Categorical Outcome �̉�́i�P�ϗʁj (6min)
- Categorical Outcome �̉�́i���ϗʁj (8min)
- ���ӎ��� (10min)
- �Q�l���� (-min)



Categorical Outcome
========================================================
- �A�E�g�J���ƂȂ�ϐ�����l�ȏ�̗��U�I�Ȓl�ł��邱��
- Familiar with
 - Death (1 = death)
 - Readmission (1 = readmission)
- In Rheumatoid Arthritis
 - DAS remission (DAS28-ESR < 2.6)
 - HAQ remission (HAQ-DI <0.5)
 - Radiographic remission (delta TSS <U+2264>0)

�{�����b������e
=======================================================
- Categorical Outcome in Rheumatoid Arthritis (1min) 
- Categorical Outcome �̉�́i�P�ϗʁj (6min) ��
- Categorical Outcome �̉�́i���ϗʁj (8min) 
- ���ӎ��� (10min)
- �Q�l���� (-min)


Categorical Outcome �̉�́i�P�ϗʁj
========================================================
- **�A���ϐ��̏ꍇ**
 - ���ϒl���r����B
 - $\mu = \frac{\sum_{k=1}^n(x_k)}{n}$, $var = \frac{\sum_{k=1}^n(x_k-\mu)^2}{n}$
 - t-test��ANOVA ���ŃO���[�v�Ԃ̕��ς��r���邱�Ƃ���ʓI

***

- **�J�e�S���J���ϐ��̏ꍇ**
 - ����(propotion)���r����B
 - $P = \frac{X}{n}$, $var = p(1-p)$  
   *X�͎���1���N����������*
 - $\chi^2$ test ���ŃO���[�v�Ԃ̊����̔�r������̂���ʓI
 - �����܂ł̑��x�i�n�U�[�h�j���ׂ��肷���@�����邪����͑ΏۊO�B




Categorical Outcome �̉�́i�P�ϗʁj
========================================================
**�����̔�r**

    x   | col1   | col2
  ----|--------|--------
  row1| a     | b
  row2| c      | d
  - ���X�N  
    $Risk = \frac{a}{a+b}$
  - �I�b�Y  
    $Odds = \frac{a/a+b}{b/a+b} = \frac{a}{b}$

***
 - ���X�N��
    $$
     \hat{RD} = \frac{c}{c+d} 
    $$
 - ���X�N��
    $$
    \hat{RR} = \frac{a}{a+b} / \frac{c}{c+d}
    $$
 - �I�b�Y��
    $$
    \hat{OR} = \frac{a}{b} / \frac{c}{d}
    $$

Categorical Outcome �̉�́i�P�ϗʁj
========================================================
**95%�M�����**

x   | col1   | col2
  ----|--------|--------
  row1| a     | b
  row2| c      | d

  $P_a = \frac{a}{a+b}$,  $P_c = \frac{c}{c+d}$  

***

 - ���X�N�� (Rusk Difference)
    $$
     RD = \hat{RD} \pm 1.96SE
     $$
     $$
     SE = \sqrt{\frac{P_a(1-P_a)}{a+b}+\frac{P_c(1-P_c)}{c+d}}  
    $$

 - ���X�N�� (Risk Ratio)
    $$
    log(RR) = log(\hat{RR}) \pm 1.96SE
    $$
    $$
    SE=\sqrt{\frac{1}{a} - \frac{1}{a+b} + \frac{1}{c} - \frac{1}{c+d}}
    $$
 - �I�b�Y�� (Odds Ratio)
    $$
    log(OR) = log(\hat{OR}) \pm 1.96SE
    $$$$
    SE=\sqrt{\frac{1}{a} + \frac{1}{b} + \frac{1}{c} + \frac{1}{d}}
    $$


Categorical Outcome �̉�́i�P�ϗʁj
========================================================
class: small-code
- $\chi^2$ test with R

    x | **col1**   | **col2**
  ----|:--------:|--------:
  **row1**| 14     | 8
  **row2**| 4      | 17
 - chisq.test(x)


```r
x <- matrix(c(14, 8, 4, 17), ncol=2, byrow=T)
chisq.test(x)
```

```

	Pearson's Chi-squared test with Yates' continuity correction

data:  x
X-squared = 7.0406, df = 1, p-value = 0.007968
```
***
- Fisher's exact test
  - fisher.test(x)

```r
 fisher.test(x)
```

```

	Fisher's Exact Test for Count Data

data:  x
p-value = 0.005089
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
  1.56789 39.54979
sample estimates:
odds ratio 
  7.051895 
```

Categorical Outcome �̉�́i�P�ϗʁj
========================================================
**�I�b�Y��̉���**  
- ��l1 (*0<OR<inf*)
- �Տ��I����
 - Number Needed to Treat(NNT)
 
 $NNT = \frac{1}{RD} = \frac{1}{EER - UER}$
 
 $= \frac{1}{(OR-1)\times UER} + \frac{OR}{(OR-1)\times(1-UER)}$  
  $EER:Exposed Event Propotion, UER:Unexposed Event Propotion$  
- ��l�A�E�g�J����������ɂ͉��l���Ái���I�j���󂯂Ȃ���΂Ȃ�Ȃ����B
  Number needed to be exposed(NNE) �Ƃ��Ăѕ��͐F�X����̂ŃV�`���G�[�V�����ɍ��킹�Ďg���킯�B
  
�{�����b������e
=======================================================
- Categorical Outcome in Rheumatoid Arthritis (1min) 
- Categorical Outcome �̉�́i�P�ϗʁj (6min) 
- Categorical Outcome �̉�́i���ϗʁj (8min) ��
- ���ӎ��� (10min)
- �Q�l���� (-min)


���ʂ̑��ϗʉ�A������ȗ��R
==================================
class: small-code
**���ϗʉ�A�i��ʐ��`���f���j**
$$
Y = \beta_0 + \beta_1x_1 + \eta  
$$
$$
Y = \{y|0,1\}
$$




```r
summary(lm(y~x_1))
```

```

Call:
lm(formula = y ~ x_1)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.70490 -0.18658  0.00052  0.18002  0.69332 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 0.498505   0.008238   60.51   <2e-16 ***
x_1         0.074266   0.001432   51.87   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.26 on 998 degrees of freedom
Multiple R-squared:  0.7294,	Adjusted R-squared:  0.7292 
F-statistic:  2690 on 1 and 998 DF,  p-value: < 2.2e-16
```

���ʂ̑��ϗʉ�A������ȗ��R
==================================
class: small-code

![plot of chunk unnamed-chunk-6](R_presentation-figure/unnamed-chunk-6-1.png) 
- Y �̒l��$\{0,1\}$ �ł���͂��Ȃ̂ɂ��蓾�Ȃ����l�����݂���B

***

![plot of chunk unnamed-chunk-7](R_presentation-figure/unnamed-chunk-7-1.png) 
- �c�����S���ϓ��ɕ��z���Ȃ��B

logistic regression
==================================
- ���W�X�e�B�b�N��A�Ƃ�*Y* ��\������̂ł͂Ȃ��A*���X�N(propotion)* ��\�����郂�f���B
![plot of chunk unnamed-chunk-8](R_presentation-figure/unnamed-chunk-8-1.png) 

logistic regression
==================================
- ���W�X�e�B�b�N��A�Ƃ�*Y* ��\������̂ł͂Ȃ��A*���X�N(propotion)* ��\�����郂�f���B
 - ���X�NP�����܂��\���ł���֐�
 - $P=f(z)=\frac{1}{1+e^{-z}}$
 - $f(z)$ ��*Logistic Function* �ƌĂ�ł���B

***
- �O���t�������Ă݂�Ɛ�قǂ̃��X�N�̃O���t�Ƃ悭���Ă���̂��킩��B
![plot of chunk unnamed-chunk-9](R_presentation-figure/unnamed-chunk-9-1.png) 

logistic regression
==================================
**Logistic Function ����Logistic regression ��**
- $P=f(z)=\frac{1}{1+e^{-z}}$ ��$z$ �Ƃ����ϐ��Ō��܂��Ă���B
- ���Ƃ��ΔN������ƃ��X�N�������Ƃ����󋵂́A�u$z$��AGE�������قǑ傫���Ȃ�v�Ƃ���킹��B  
  $z = \beta_0+\beta_1x_1 + \beta_2x_2 + \cdots+\beta_kx_k$  
  $f(z) = \frac{1}{1+e^{-z}}$  
  $f(z) = \frac{1}{1+e^{-\beta_0+\beta_1x_1 + \beta_2x_2 + \cdots+\beta_kx_k}}$
- ����킳���֐�($f(z)$)�����ۂ̃f�[�^����Z�o�����P�����܂�����킷�悤��$\beta_0 \cdots \beta_kx_k$ ��ݒ肵�Ă�����B
- �ݒ�̎d���i�Ŗސ���j�̓\�t�g�E�F�A�ɔC����B
- ��ʐ��`���f������ʉ��������`���f���Ȃ̂�**��ʉ����`���f��**�ȂǂƌĂ΂��

logistic regression
==================================
**Logistic regression ��Odds Ratio**
- $P=f(z)=\frac{1}{1+e^{-z}}$��z�ɂ��ĉ���
$z = log(\frac{p}{1-p})$
- $\frac{p}{1-p}$ ��Odds������킷�B

logistic regression
==================================
- �܂�A�j����z ��$z_m$ ������z ��$z_f$�Ƃ���ƁA$z = \beta_0+\beta_1Sex + \beta_2Age$ ��$\beta_1$���������̂�$log(OR)$�ƂȂ�B  
$\beta_1 = \frac{z_m-z_f}{1-0}$  
$=log(\frac{p_m}{1-p_m})-log(\frac{p_f}{1-p_f})$  
$= log(\frac{p_m}{1-p_m}/\frac{p_f}{1-p_f})$  
$OR = \frac{p_m}{1-p_m}/\frac{p_f}{1-p_f}= e^{\beta_1}$

�N��i�A���ϐ��j�̏ꍇ�N�1�P�ʑ��������ꍇ�̃I�b�Y����Z�o�ł���B  
$\beta$�̐M����Ԃ̏o�����Ȃǂ̓\�t�g�E�F�A�ɔC���܂��傤�B

logistic regression �̎g���ǂ���
===========================================
Logistic regression �ɂ͑傫��2�̎g���ǂ��낪����B
- ���ʐ��_���f��
- �\�����f��

���̓�́A���Ă���悤�Œ��ӂ��ׂ��_���قȂ�B  
���̂��ߎ������ǂ���̎g���������Ă���̂��ӎ����Ă����K�v������B


logistic regression �̎g���ǂ���
===========================================
**���ʐ��_���f��**  

- �Ɨ��ϐ��΂���]���ϐ��̉e���x����m�肽���B  
- �������p�����[�^: $\beta$  

*�Ⴆ��*  

 - ���E�}�`�Ǘ�ɂ����āA����̈��q�i���Â⊳�Ҕw�i�j���Ǐ�̊����Ɗ֘A���Ă��邩���ׂ����B


***
**�\�����f��**
- �]���ϐ������^�Ƃ��āA���ꂼ��̏Ǘ�̃A�E�g�J����������m����m�肽���B
- �������p�����[�^: $P$  

*�Ⴆ��*  

 - ���E�}�`�Ǘ�ɂ����āA�Ǐ󂪊������邩�ǂ������e��\����q����\���������B

logistic regression �̎��{
===========================================
class: small-code
- R �ł�glm()��p���邱�Ƃ������B
 - glm(): ��ʉ����`���f���̎��s
 - glm(data, formula, family = logit(binomial))


```r
train_data <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
summary(train_data)
```

```
     admit             gre             gpa             rank      
 Min.   :0.0000   Min.   :220.0   Min.   :2.260   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:520.0   1st Qu.:3.130   1st Qu.:2.000  
 Median :0.0000   Median :580.0   Median :3.395   Median :2.000  
 Mean   :0.3175   Mean   :587.7   Mean   :3.390   Mean   :2.485  
 3rd Qu.:1.0000   3rd Qu.:660.0   3rd Qu.:3.670   3rd Qu.:3.000  
 Max.   :1.0000   Max.   :800.0   Max.   :4.000   Max.   :4.000  
```


logistic regression �̎��{
===========================================
class: small-code
- R �ł�glm()��p���邱�Ƃ������B
 - glm(): ��ʉ����`���f���̎��s
 - glm(data, formula, family = logit(binomial))


```

Call:
glm(formula = admit ~ gre + gpa + rank, family = "binomial", 
    data = train_data)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.6268  -0.8662  -0.6388   1.1490   2.0790  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)    
(Intercept) -3.989979   1.139951  -3.500 0.000465 ***
gre          0.002264   0.001094   2.070 0.038465 *  
gpa          0.804038   0.331819   2.423 0.015388 *  
rank2       -0.675443   0.316490  -2.134 0.032829 *  
rank3       -1.340204   0.345306  -3.881 0.000104 ***
rank4       -1.551464   0.417832  -3.713 0.000205 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 499.98  on 399  degrees of freedom
Residual deviance: 458.52  on 394  degrees of freedom
AIC: 470.52

Number of Fisher Scoring iterations: 4
```

�{�����b������e
=======================================================
- Categorical Outcome in Rheumatoid Arthritis (1min) 
- Categorical Outcome �̉�́i�P�ϗʁj (6min) 
- Categorical Outcome �̉�́i���ϗʁj (8min) 
- ���ӎ��� (10min) ��
- �Q�l���� (-min)


logistic regression �̎��{�ɔ���������
===========================================
Logistic Regression �̓R�}���h��ŊȒP�Ɏ��{�ł���B
�������A���ӂ��Ă����ׂ��_������������B
 - Sufficient events per independent variable(�C�x���g�p�x�ƕϐ�)
 - Conformity with linear gradient for continuous variables(���ϗʂ̐��^��)
 - Tests for interactions(���ݍ�p��)
 - Collinearity(���d������)
 - Goodness-of-fit, Discrimination measures(�K���x)
 - Validation(�Ó����̌���)
 - Statistical significance(���v�w�I�L�Ӑ�)

Sufficient events per independent variable
===========================================
�C�x���g�����ɂ߂ď��Ȃ��ꍇ���ŁA$\beta$�̐��v�l���ɂ߂ĕs����ɂȂ�B

Sex=1|Treat=0|Treat=1|Treat=2
-----|-------|--------|--------
death=0|123  |246| 150
death=1|5 |0|10

*�Ή�*
- �܂��́A�N���X�\�Ŋm�F�����̂����Ń��f����g�ށB
- �ϐ��̓����iFactor=0��Factor=1�𓝍��j
- Propensity Score �ɂ���͂ɐ؂�ւ���B


Conformity with linear gradient for continuous variables(���ϗʂ̐��^��)
=============================================
�Ɨ��ϐ����A���ϐ��̏ꍇ�A�]���ϐ��Ƃ̊֌W�͐��`�ł��邱�Ƃ����肵�Ă���B
![plot of chunk unnamed-chunk-12](R_presentation-figure/unnamed-chunk-12-1.png) 
  
�Ⴆ�΁A��L�̏ꍇ���v����$\beta$��Outcome �ɑ΂�����q�̌��ʂ𐳂������v���Ă��Ȃ��B  
**�m�F**
- �܂��́A�֌W�����O���t�������ă`�F�b�N
- ���ϗʂ��J�e�S���[�����ă��f���ɓ���
  �I�b�Y��͐��`�ɂȂ��Ă��邩�H

Conformity with linear gradient for continuous variables(���ϗʂ̐��^��)
=============================================
*�Ή�*
- ���ϗʂ��J�e�S���[�����ă��f���ɓ�����Odds����
- �X�v���C���֐��⑽������A��p���ĕϐ���ϊ�����B


Tests for interactions(���ݍ�p��)
===========================================
���ݍ�p�F�ϐ��̑g�ݍ��킹��Outcome �Ƃ̊֘A���قȂ�ϐ������邩�ǂ����B  
**�Ⴆ��**  
 - ���Ö�A�͓���̈�`�q�}�[�J�[��L�����ᇂɂ͌��ʂ����邪�A�����łȂ���ᇂɂ͌��ʂ��Ȃ��B
 - �����͒j���ɂƂ��Ă͗]�������΂����ʂ����邪�A�����ɂƂ��Ă͗]����Z�k������ʂ�����B
 
���ݍ�p���͓�̕ϐ��̐ςł���킳���B
 $$logit(p) = \beta_0 + \beta_1 x_1 + \beta_2 x_2 +\beta_3 x_1*x_2$$
 
 
 
Tests for interactions(���ݍ�p��)
===========================================
���ݍ�p�̉���
 $$logit(p) = \beta_0 + \beta_1 x_1 + \beta_2 x_2 +\beta_3 x_1*x_2$$
- $x_1$��$x_2$�̌��ݍ�p���������ꍇ�A$x_1$��Odds ratio ��$x_2$��1�̏ꍇ exp($\beta_1+\beta_3$)�ɂȂ�B
- �\���l���v�Z���ĕ񍐂���ƌ��₷���B

Collinearity(���d������)
===========================================
�ϐ��Ԃ̑��ւ����܂�ɋ�����$\beta$ �̐��v�l�����肵�Ȃ��Ȃ�B�\���l�ɂ͂��܂�e�����Ȃ��B  

**�m�F**
- �ϐ��Ԃ̑��ւ��m�F���������ւ��Ȃ����H
- �T���v�����ꕔ�����ēx��A���s�����ہA�傫���W�����ς��Ȃ����H  

***






```
processing file: R_presentation.Rpres
Quitting from lines 442-449 (R_presentation.Rpres) 
 �ȉ��ɃG���[ library(GGally) : there is no package called 'GGally'
```
