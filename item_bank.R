## DOCUMENTATION

# http://cran.r-project.org/web/packages/psych/vignettes/overview.pdf
# CHECK BELOW FOR ADDITIONAL ANALYSES
# http://personality-project.org/r/book/ 
# http://philchalmers.github.io/mirt/mirt-vignettes.html
# http://cran.r-project.org/web/views/Psychometrics.html





## INSTALLING AND CALLING PACKAGES

setwd('/Users/rpietro/articles/motivational_interview/')

# setwd('/Users/rpietro/articles/motivational_interview/')
# install.packages("psych" , repos='http://cran.us.r-project.org')
# install.packages("car" , repos='http://cran.us.r-project.org')
# install.packages("ctv", repos='http://cran.us.r-project.org')
# install.packages("random.polychor.pa", repos='http://cran.us.r-project.org')
# install.packages("tcltk2", repos='http://cran.us.r-project.org')
# install.packages("WrightMap", repos='http://cran.us.r-project.org')
# install.packages("TestScorer", repos='http://cran.us.r-project.org')
# install.views("Psychometrics", repos='http://cran.us.r-project.org')
# install.packages(list(c("GPArotation","mvtnorm","MASS")


require("psych")
require("car")




## OPENING DATA

# myData <- read.clipboard()
# myData <- read.clipboard.csv()

# update code to open directly from sheet:
# https://docs.google.com/spreadsheets/d/1ieBm0AOPPLeyFyiWxRVH_IXjgAx4vHFNF1-N3vajyjY/edit#gid=167549095
# http://www.r-bloggers.com/access-google-spreadsheet-directly-in-bash-and-in-r/

mi <- read.csv("mi.csv", header = TRUE)






## DATA MANAGEMENT

# inverting variable values to ensure that a true means a correct answer
# fix directly from verdadeiro/falso

mi$pat_passiveness <- recode(mi$pat_passiveness,"0=1; 1=0")
mi$lots_of_questions_good <- recode(mi$lots_of_questions_good,"0=1; 1=0")
mi$mi_quick_and_directive <- recode(mi$mi_quick_and_directive,"0=1; 1=0")
mi$never_interrupt_pat <- recode(mi$never_interrupt_pat,"0=1; 1=0")
mi$pmi_deceive_pat <- recode(mi$mi_deceive_pat,"0=1; 1=0")
mi$quick_fix <- recode(mi$quick_fix,"0=1; 1=0")
mi$nonpersonalized_motivations <- recode(mi$nonpersonalized_motivations,"0=1; 1=0")
mi$mi_paternalist <- recode(mi$mi_paternalist,"0=1; 1=0")
mi$amb_not_common <- recode(mi$amb_not_common,"0=1; 1=0")
mi$mi_distract <- recode(mi$mi_distract,"0=1; 1=0")
mi$mi_2nd_WW <- recode(mi$mi_2nd_WW,"0=1; 1=0")
mi$mi_styles <- recode(mi$mi_styles,"0=1; 1=0")
mi$passive_listening <- recode(mi$passive_listening,"0=1; 1=0")
mi$fear_of_hp <- recode(mi$fear_of_hp,"0=1; 1=0")
mi$mi_is_instictive <- recode(mi$mi_is_instictive,"0=1; 1=0")
mi$mi_bad_for_sud <- recode(mi$mi_bad_for_sud,"0=1; 1=0")


names(mi)


# colnames(x) <- paste('V',1:10,sep='')

# item_vars_old  <- c("pat_passiveness", "lots_of_questions_good", "exaggeration_technique", "mi_quick_and_directive", "pat_says_motivations", "mi_definition", "never_interrupt_pat", "mi_deceive_pat", "quick_fix", "nonpersonalized_motivations", "only_pro_arguments", "mi_paternalist", "amb_not_common", "amb_definition", "strengthening_the_pat", "impartial_listening", "mi_colaboration", "summary_helps", "mi_distract", "mi_2nd_WW", "mi_styles", "passive_listening", "listen_costeffectiveness", "fear_of_hp", "ask_not_direct", "verbalize_helps", "mi_is_instictive", "mi_low_cost", "mi_clinical_conditions", "mi_bad_for_sud")

item_vars <- c("pat_passiveness", "pat_says_motivations", "quick_fix", "amb_definition", "strengthening_the_pat", "summary_helps", "mi_distract", "verbalize_helps", "mi_low_cost","mi_clinical_conditions","mi_distract","summary_helps","no_mot_dif","criticize_relapse","confrontation_quest","aa_uses_mi","normalizing_techniq","info_is_change","mi_rogers_empathy","mi_pretreatment","accept_and_approve","scores_questions")

mi_items  <- mi[item_vars]
headTail(mi_items)
## below will give you a sense of ceiling and floor effects where mean value is the percentage of correct answers for a given items
summary(mi_items)


item_socdem_vars  <- c("age","gender","education")
mi_socdem_items  <- mi[item_socdem_vars]


item1_vars <- c("pat_passiveness", "pat_says_motivations", "quick_fix", "amb_definition", "strengthening_the_pat", "summary_helps", "mi_distract", "verbalize_helps")
mi1_items_  <- mi[item1_vars]
mi1_items  <- mi1_items_[complete.cases(mi1_items_),]
# final[complete.cases(final),]
headTail(mi1_items)
## below will give you a sense of ceiling and floor effects where mean value is the percentage of correct answers for a given items
summary(mi1_items)


item2_vars <- c("mi_low_cost","mi_clinical_conditions","mi_distract","summary_helps","no_mot_dif","criticize_relapse","confrontation_quest","aa_uses_mi","normalizing_techniq","info_is_change","mi_rogers_empathy","mi_pretreatment","accept_and_approve","scores_questions")
mi2_items_  <- mi[item1_vars]
mi2_items  <- mi2_items_[complete.cases(mi2_items_),]
# final[complete.cases(final),]
headTail(mi2_items)
## below will give you a sense of ceiling and floor effects where mean value is the percentage of correct answers for a given items
summary(mi2_items)



## GRAPHICAL EXPLORATORY ANALYSIS

describe(mi)
headTail(mi)
str(mi)
describeBy(mi,mi$gender,skew=FALSE,ranges=FALSE)
mi.mat <- describeBy(mi,list(mi$gender,mi$education), skew=FALSE,ranges=FALSE,mat=TRUE)
headTail(mi.mat)

# png('outlier.png')
# (d2 <- outlier(mi,cex=.8))
# dev.off()



# png('pairspanels.png')
# sat.d2 <- data.frame(mi,d2) #combine the d2 statistics from before with the mi data.frame
# (pairs.panels(sat.d2,bg=c("yellow","blue")[(d2 > 25)+1],pch=21))
# dev.off()

# png('affect.png')
# (pairs.panels(affect[14:17],bg=c("red","black","white","blue")[affect$Film],pch=21, + main="Affect varies by movies "))
# dev.off()


# violinBy(mi[5:6],mi$gender,grp.name=c("M", "F"),main="Density Plot by gender for SAT V and Q")


# STOPPED AT PAGE 17







## FACTOR ANALYSIS

# http://personality-project.org/r/psych/help/irt.fa.html

# http://stats.stackexchange.com/questions/31948/looking-for-a-step-through-an-example-of-a-factor-analysis-on-dichotomous-data


fa_mi1_1factor <- fa.poly(mi1_items, nfactors=1, rotate="varimax")    # polychoric FA
fa_mi1_1factor$fa$loadings        # loadings are the same as above ...

fa_mi2_1factor <- fa.poly(mi2_items, nfactors=1, rotate="varimax")    # polychoric FA
fa_mi2_1factor$fa$loadings        # loadings are the same as above ...




fa_mi1_1factor <- fa.poly(mi1_items, nfactors=2, rotate="varimax")    # polychoric FA
fa_mi1_1factor$fa$loadings        # loadings are the same as above ...

fa_mi2_1factor <- fa.poly(mi2_items, nfactors=2, rotate="varimax")    # polychoric FA
fa_mi2_1factor$fa$loadings        # loadings are the same as above ...




factor.plot(fa_mi1_1factor$fa, cut=0.5)
fa.diagram(fa_mi1_1factor)

factor.plot(fa_mi2_1factor$fa, cut=0.5)
fa.diagram(fa_mi2_1factor)


fa.parallel.poly(mi1_items)      # parallel analysis for dichotomous data
fa.parallel.poly(mi2_items)      # parallel analysis for dichotomous data

# library(random.polychor.pa)    # for random.polychor.pa()
# random.polychor.pa(data.matrix=mi_items, nrep=5, q.eigen=0.99)

# use xtable to display tables



## CLUSTER ANALYSIS
# possible with dichotomous items??
# iclust
# vss


## CORRESPONDENCE ANALYSIS

# also see entire section about CA on http://cran.r-project.org/web/views/Psychometrics.html
require(ca)



## ITEM ANALYSIS

 # need to convert below to numeric variables to make it work
# best.scales(mi_items_age_gender_educ,criteria=c("gender","education","age"),cut=.1,dictionary=bfi.dictionary[,1:3])
# mirt for irt-fa






## IRT

# factor analysis again
mi1_irt  <- irt.fa(mi1_items)
irt.fa(mi1_items[1:5])
irt.fa(mi1_items[6:10])

op1 <- par(mfrow=c(3,1))
plot(mi1_irt,type="ICC")
plot(mi1_irt,type="IIC")
plot(mi1_irt,type="test")
op1 <- par(mfrow=c(1,1))





# factor analysis again
mi2_irt  <- irt.fa(mi2_items)
irt.fa(mi2_items[1:5])
irt.fa(mi2_items[6:10])

op1 <- par(mfrow=c(3,1))
plot(mi2_irt,type="ICC")
plot(mi2_irt,type="IIC")
plot(mi2_irt,type="test")
op2 <- par(mfrow=c(1,1))


## DIF

require(difR)
require(mirt)
require(lordif)
require(latdiag)





## IRT SCORING

total <- rowSums(mi_items)
ord <- order(total)
items <- mi_items[ord,]
scores <- score.irt(mi_irt,items)
headTail(scores)
# unitweighted <- score.irt(items=mi_items,keys=rep(1,9))
# warnings()
# scores.df <- data.frame(true=v9$theta[ord],scores,unitweighted)
# colnames(scores.df) <- c("True theta","irt theta","total","fit","rasch","total","fit")

# http://cran.r-project.org/web/packages/ltm/ltm.pdf
require(ltm)






## BIFACTOR MODELING

om <- omega(mi_irt$rho,3)


## QGRAPHS

# http://www.jstatsoft.org/v48/i04/paper
# http://cran.r-project.org/web/packages/qgraph/qgraph.pdf


## WRIGHT MAP
require(WrightMap)
# Plotting results of a unidimensional Rasch Model
## Mock results
uni.proficiency <- rnorm(1000, mean = -0.5, sd = 1)
difficulties <- sort( rnorm( 20))
## Default map
wrightMap( uni.proficiency, difficulties)
## Density version
wrightMap( uni.proficiency, difficulties, use.hist = FALSE)




## BRADLEY-TERRY MODELS FOR COMPARISON BETWEEN ANY TWO HEALTHCARE PROFESSIONALS

# http://cran.r-project.org/web/packages/BradleyTerry2/vignettes/BradleyTerry.pdf
# http://bradleyterry2.r-forge.r-project.org/extendedBTmodels.pdf

require("BradleyTerry2")




## LINKING DIFFERENT WAVES

# http://cran.r-project.org/web/packages/plink/index.html
# http://cran.r-project.org/web/packages/plink/vignettes/plink-UD.pdf
require(plink)



## GUI 

library(TestScorer)
library(tcltk2)




## COPY DETECTION

require(CopyDetect)





## CAT

require(catR)
# http://cran.r-project.org/web/packages/catR/index.html






## MULTILEVEL ANALYSIS

# Dei uma olhada no banco de dados e acho q uma excelente comparação seria PSIQUIATRAS + PSICOLÓGOS (SPECIALISTS) VS OUTROS (NON-SPECIALISTS). Temos 102 indíviduos (49 no SPEC. e 53 no NON-SPEC). N bem próximos nos 2 grupos (ANEXEI UMA PLANILHA, 0 é para os NON-SPEC., 1 é para os SPEC. )





## MIRT

require(mirt)






## DAKS

# http://cran.r-project.org/web/packages/DAKS/vignettes/DAKS.pdf