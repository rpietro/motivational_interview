# An educational, reproducible parallel randomized controlled trial comparing a scalable coaching clinical training in motivational interviewing vs. standard online training and its effect on knowledge, clinical impact and provider satisfaction with the learning experience.

Gustavo Medeiros  
Hermano Tavares  
Bruno Melo  
Joao Ricardo Vissoci  
Ricardo Pietrobon  


## Abstract
<!-- write at the end -->

## Introduction

Motivational interviewing has been demonstrated to be fairly efficacious and effective strategy in controlling a number of highly prevalent mental health conditions, among them disruptive, impulse-control, and conduct disorders ([Burke, 2003](http://www.vcu.edu/idas/pdfs/efficacy%20of%20MI-meta-analysis.pdf); [Lundahl, 2009](http://faculty.fortlewis.edu/burke_b/criticalthinking/readings/mi-burke.pdf)). Despite its demonstrated effectiveness, training novice providers in motivational interviewing has remained a craft, traditional coaching models where a novice is mentored 1:1 by an expert still being the most prevalente model. <!-- ref --> Although effective, this method is all but scalable.

* lit review on motivational interviewing efficacy (trials) and effectiveness (non-trial)
* lit review on educational methods applied to motivational interviewing and mental health conditions in general

The objective of this educational, reproducible, parallel randomized trial is therefore to compare a scalable coaching training intervention versus a control training method among a group of healthcare professionals and students who frequently encounter patients with mental health problems. We measured its effect on knowledge, clinical impact and satisfaction. We hypothesized that, compared to control, the "scalable coaching arm" would result in increased knowledge, clinical impact and provider satisfaction with the learning experience.


## Methods

This trial was designed and reported in accordance with the recommendations provided by the [CONSORT statement, version 2010](http://www.consort-statement.org/)

### Ethics
This study was approved by the Ethics Committe at the University of São Paulo ([Universidade de São Paulo](http://www5.usp.br/en/)), informed consent having been waived since this was considered a research with minimal risk within an educational context. All participants were ensured that their involvement with the trial was absolutely unrelated to their performance in their current work or study and that they could exit the study at any point if they so desired.

### Trial Design

This is a parallel, reproducible, controlled randomized trial comparing a control versus a scalable coaching arm. The trial involved 106 participants who completed the trial <!-- replace by the actual number and describe dropout rate -->, randomized on a 1:1 ratio to the intervention and control arms, with the intervention and respective follow-up lasting a total of four weeks. No changes to the initially methods design were implemented while the trial was in course. <!-- need to check at the end whether this is true -->

### Participants
Our study involved 106 participants. Participants were health care providers or students at <!-- add -->, located in the metropolitan area of São Paulo. For each participant we have collected information on gender, age, profession and previous educational background.

### Interventions

<!-- add details about intervention -->


The control arm was provided with weekly texts for them to read regarding motivational interviewing. These texts focused on <!-- add later -->

All educational material for this course is made available within our Reproducible Research repositories, and delivered through the original [Open edX platform](http://code.edx.org/). Videos were provided in Brazilian Portuguese. All remaining material was made available in Portuguese, although both Italian and English versions are provided within our Reproducible Research repositories (see subsequent section on Reproducible Research).


<!-- add CONSORT for Non-Pharmacological Treatment Interventions -->

<!-- soft skills, tacit knowledge, rationality, competition, empathy, choice, aesthetics, memory, emotion, happiness - ask mauro for opinion on what could work -->

### Outcome variables
<!-- : toolkit send email to yourself as 4 ferramentas vão ser, a principio:  outcome variables:  -->

Our study had four main categories of outcome variables: work engagement, meaning, purpose in life and job satisfaction, all described under the subsequent sections. Per CONSORT Statement guidelines, any eventual changes to outcome measures deviating from the initial plan and occurring throughout the trial were recorded in our versioning system ([Github](https://github.com/)), thus ensuring full reproducibility. However, changes were avoided unless strictly necessary.


#### Work engagement
short scale, validation references

#### Meaning
short scale, validation references

#### Purpose in life 
short scale, validation references

#### Job satisfaction
short scale, validation references


####  Sample size

Given the absence of preliminary efficacy data, we calculated our sample size based on an assumption of a two-sample t-test for an index representing the worst case scenario for each of the three outcome variables, with an effect size of 55%, a significance level and statistical power set at the traditional levels of 0.05 and 80%, respectively. Under these assumptions the estimated required sample size is of 52.9 per group, which we have rounded to 53, ultimately leading to a total sample size of 106 participantsin total. Taking into account a worst case scenario dropout rate of approximately 20%, we therefore plan to enroll 140 participants.


####  Interim analyses and stopping guidelines

Given the relatively short duration of our trial, we did not perform an interim analyses. In addition, given the low risk associated with the intervention, our guidelines did recommend that the trial be stopped in case of an unlikely loss of confidentiality that might compromise participants privacy, which has not occurred.

####  Randomization: sequence generation

All randomization schedules were delivered through [Planout](http://facebook.github.io/planout/) within the [edx Code](http://code.edx.org/) platform. Briefly, Planout makes use of a pseudorandom number generator from the [Python language](https://www.python.org/), which has been extensively tested. <!-- need ref --> Randomization was blocked at 10 participants, thus decreasing the likelihood of a possible imbalance.  

All randomization was delivered through the Open edX platform, thus ensuring that participants and investigators are blind to the allocation. Data analysts (RP and JRV) received a dataset from the computer scientist (BM) where the two randomization arms were designated by unspecific letters, thus ensuring that the analysis is also conducted in a blind fashion.


#### Statistical methods 

All analyses were conducted by the members in our team (RP, JRV). The data analysis started with an overall evaluation of individual variables to assess distributions for continuous variables (e.g., participant's age) in terms of their distributions, as well as the frequency/percentage for categorical variables (e.g., gender). 

Missing values were handled differently if they happened to individual variables or full encounters, e.g., an entire evaluation for a week. Individual variables were imputed starting by an exploratory visual analysis to better understand the potential underlying pattern behind missing values for each variable. This analysis was conducted using the [VIM package](http://cran.r-project.org/web/packages/VIMGUI/vignettes/VIM-Imputation.pdf) within the [R language](http://www.r-project.org/). Depending on the pattern of missing data, we might then choose one of several alternatives, ranging from not imputing when the percent missing might be negligible, imputing using predictive models from variables that are hypothesized to be associated with the missing values (e.g., age predicting residency year), or multiple imputation in cases where missing patterns might be happening at random (MAR or missing at random) (@rubin1976inference). <!-- see 3d grant -->

We evaluated for potential confounding of the intervention effect by assessing balance across baseline variables between the scalable coaching and control arms. This evaluation occurred for the overall study. While imbalances were unlikely given that we are using a series of preventive measures (blinding, concealed allocation, blocking and stratification), eventual imbalances were evaluated on an individual basis and required adjusting in our modeling strategy (see below for details).

The psychometric analysis for parallel validation of our scales started with an Exploratory Factor Analysis to evaluate the underlying dimensional structure of our item pool. We then conducted a Confirmatory Factor Analysis using the hypothesized domains (see Outcome Variable section for extensive details). Once domains are established we used Cronbach's alpha to measure internal reliability within each construct. Validity was measured by triangulation across different domains. 

Given that all of our outcomes have multiple endpoints over time, we used a combination of mixed models and survival analysis to measure the efficacy associated with the "better half toolkit" in comparison with the control arm. To formally test trends in each of our outcome variables over time we developed mixed models that account for multiple measures as random a effect. For each time period we also assessed differences in scores. These bivariate analyses incorporated robust standard errors to account for the clustering effect.


### Reproducible research
In order to follow a reproducible research protocol, we have written our final manuscript using [Rmarkdown](http://www.rstudio.com/ide/docs/authoring/using_markdown), which combines the R language with the [Markdown markup](http://daringfireball.net/projects/markdown/), ultimately allowing us to leave all calculations and data manipulation within the article text. All data sets and respective analytical scripts were provided in CSV (comma separated value) formats in open public repositories including [Figshare](http://figshare.com/) and [Github](https://github.com/). In addition, we have also stored the version of the software used in this analysis and deposited it within our Github and Figshare repositories, ultimately decreasing the probability of reproducibility issues during subsequent attempts to reproduce our analyses. <!-- add paper that recommends this procedure -->

## Results

<!-- add this section in alignment with CENT -->

## Discussion





<!-- 

See: The Effectiveness and Applicability of Motivational Interviewing: A Practice-Friendly Review of Four Meta-Analyses. Brad Lundahl and Brian L. Burke.

See: Client Resistance as Predicted by Therapist Behavior: A Study of Sequential Dependence. Mary M. Bischoff and Terence J. G. Tracey

Intervention:
4-session program using clinical-focused techniques (such as the ,“mind scan” technique, “fly on the wall” technique, clinical cases, practitioner points) and “advanced presentation mode”. 
Each one around (30 minutes?) One-week minimum between each session? 1 or 2 branches?

Personalization, empathy, evocar coisas positivas e daí ancorar pra modificar comportamento (Rogers motivational interviewing) - http://en.wikipedia.org/wiki/Motivational_interviewing 

Session 1: Basic Introduction to Motivational Interviewing.
Session 2: Common errors (during “wrong interviewing” we ask questions – ‘fly on the wall’ - and we present common private thoughts – ‘mind scan’ and reactions of patients).
Session 3: 	How to use Motivational Interviewing (during “right interviewing” we ask questions – ‘fly on the wall’ - and we present common private thoughts – ‘mind scan’ and reactions of patients).
Session 4: Evaluation of techniques and closure.

Control: standard presentation (slides and 2D figures).



Outcome:
    -	Persuasion of instructor.
Student Satisfaction.
Improve knowledge in Positive Psychology.
Improve clinical use of Positive Psychology Techniques.

Scales: Questions (5-point scale or 7-point scale).

Beginning of the class (use in sessions 2 to 4): How of the knowledge gained in last class did in your clinical practice? 

End of the classe”s
Persuasion http://casaa.unm.edu/download/miti3_1.pdf

Overall how effective was the instructor?
Overall how worthwhile was the course?
Overall how much did you learn?


1) Não focar o curso de Entrevista Motivacional apenas em problemas psiquiátricos mas em problemas significativos de saúde pública e com alta prevalência. Por exemplo, não dar exemplos específicos de psiquiatria  (p.e Gambling, Anorexia, etc) mas focar os exemplos em TABAGISMO, ALCOOLISMO, EXERCÍCIO FÍSICO E QUEM SABE ATÉ ALGUM EXEMPLO CLÍNICO COMO HIPERTENSÃO. 
2) Isso permitiria que nosso publico alvo ampliasse de mental health professionals para health professionals (incluindo general practicioners, nurses, students, etc...). O que tb facilita o recrutamento: primeiro porque aumenta o publico, segundo porque ele tem contato com a parte de saude primária da prefeitura onde ele pode divulgar nosso curso.




 -->