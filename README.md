<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/Logo_INSAvilletoulouse-RVB.png" style="float:left; max-width: 130px; display: inline" alt="INSA"/></a> 
<a href="http://www.univ-tlse3.fr/" ><img src="http://www.univ-tlse3.fr/medias/photo/ut3pres_logoq_1372757033342.jpg?ID_FICHE=49702" style="float:right; max-width: 250px; display: inline"  alt="insa"/></a>
<br>  </br>

# Apprentissage Statistique Loyal pour IA Ethique
## Ressources pédagogiques

## *Fair Machine Learning for Ethical AI: educational resources*


#### [Philippe Besse](https://www.math.univ-toulouse.fr/~besse/)(1) et [Jean-Michel Loubes](https://perso.math.univ-toulouse.fr/loubes/)(2)

(1) Université de Toulouse -- INSA

(2) Université de Toulouse -- Paul Sabatier

## 1 Introduction
### 1.1 IA au quotidien et apprentissage statistique
Associant données massives (*big data*) et algorithmes d’[apprentissage automatique](https://github.com/wikistat/Apprentissage) (*machine learning*), la puissance des outils de décision automatique suscite autant d’espoir que de craintes. Ces algorithmes, acteurs  de l'Intelligence Artificielle (IA) au quotidien, construisent des décisions issues de prévisions obtenues après estimation ou entraînement sur une base de données personnelles: attribution d'un crédit et prévision du risque de mauvais paiement; profilage et publicité en ligne; prime d'assurance auto et conduite accidentogène; imagerie médicale et risque de malignité d'une tumeur; passé comportemental, environnement social et risque de récidive. 

Laissons de côté les effets médiatiques rabâchés : véhicule autonome devant choisir entre un landau et un fauteuil roulant, robot humanoïde affectueux, lois d'Azimov de la robotique, transhumanisme, singularité
technologie... bref les débats de science fiction ou encore ceux sociétaux anxiogènes: destruction des emplois même qualifiés, robots armés, *big data big brother*... 

### 1.2 IA, loi et usage éthique
Laissons à la CNIL les problèmes bien identifiés de *confidentialité des données*  et à l'Autorité de la Concurrrence ceux d’*entrave à la concurrence*. Nous nous focalisons sur les algorithmes d’*apprentissage statistique*, pour aborder les [Enjeux Ethiques de l’Algorithme et de l’Intelligence artificielle](https://www.cnil.fr/fr/comment-permettre-lhomme-de-garder-la-main-rapport-sur-les-enjeux-ethiques-des-algorithmes-et-de) (CNIL 2017) également très présents dans le [rapport Villani](https://www.aiforhumanity.fr/pdfs/9782111457089_Rapport_Villani_accessible.pdf) (2018, partie 5). 

De nombreux textes législatifs européens (RGPD avril 2018) et français récemment promulgués (juin 2018) tentent d’encadrer les usages de ces outils.  La mise en perspective détaillée de ces textes ([Besse et al. 2018-b](https://hal.archives-ouvertes.fr/hal-01886699v1)), face à la complexité et l’opacité des algorithmes d’apprentissage, révèle d’importantes disruptions technologiques. Ainsi, des vides juridiques  soulèvent des problèmes ou risques sérieux lorsques des décisions, susceptibles d'impacter des personnes physiques ou même simplement de les profiler, sont le résultat de procédures algorithmiques exécutées sur des données personnelles. Seules des pratiques éthiques sont alors susceptibles de combler les lacunes pour palier des problèmes aux conséquences qui peuvent s'avérer assez considérables. Comme le rappellent de façon réccurrente les aventures de facebook ou Google, des pratiques déloyales peuvent conduire à des rejets massifs de la part des utilisateurs voire à des condamnations. 

C'est l'acceptabilité des algorithmes d'Intelligence Artificielle qui est en jeu. 

### 1.3 Objectif
Le principal objectif du présent dépôt est de mettre à disposition des ressources pédagogiques (tutoriels) afin de *promouvoir des pratiques loyales et éthiques* indispensables au développement de la confiance des citoyens, justiciables, consommateurs, patients, contribuables, envers l'IA pour en faire accepter l'usage au quotidien.

Sur des cas d'usage bien identifiés, des tutoriels (*jupyter notebook*) permettent de poser concrètement les questions de loyauté des algorithmes et d'en évaluer les solutions récemment proposées et régulièrement mises à jour sur ce dépôt.

Plius précisément il s'agit de détailler le fonctionnement d'outils et critères, généralement statistiques,  de détection de pratiques déloyales, éventuellement de corrections et également d'aide à l'explication de décisions algorithmiques.

Ces outils sont ceux suceptibles d'être intégrés à une *procédure d'audit* des algorithmes d'apprentissage.

### 1.4 Environnement technique
Les outils sont déployés sous la forme de tutoriels: calepins ou *jupyter notebooks*. Des compléments d'informations sur les outils et algorithmes  sont à rechercher dans les autres tutoriels du dépôt [`github/wikistat`](https://github.com/wikistat). 

Le choix a été fait de développer les calepins avec les langages [R](https://github.com/wikistat/Intro-R) ou [Python](https://github.com/wikistat/Intro-Python); R plus simple et intuitif propose de nombreuses librairies facilitant les aides à l'interprétation, notamment graphiques et statistiques. En revanche Pyhton s'avère souvent plus efficace et reste un outil de référence dans la communauté numérique du *fair learning*. Il permet des développements plus opérationnels.

<img src="https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F1a%2F17%2F95%2F1a1795bc25875e8644999af9534e34ab.jpg&sp=830af7d9d0d4008220ea00bc427d8062"
     style="float:center; max-width: 500px; display: inline"  alt="Wikistat" />Le Chat par Philippe Geluck<br>

Trois aspects majeurs sont à considérer et détaillés par [Besse et al. 2018-b](https://hal.archives-ouvertes.fr/hal-01886699)

## 2 Qualité des décisions algorithmiques
### 2.1 Contexte déontologique
Les algorithmes d'apprentissage ne sont pas prouvables, certifiables de façon déterministe comme des algorithmes procéduraux. Néanmoins, l'évaluation de la qualité d'une décision algorithmique est une question essentielle lorsqu'il s'agit, par exemple, de discuter de l'opportunité d'une opération chirurgicale ou encore de la libération conditionnelle d'un détenu. Malheureusement la loi est muette sur ce sujet et n'oblige en rien à la communication des estimations des qualités des prévisions conduisant aux décisions, comme c'est le cas pour un sondage d'opinion. 

Il n'est pas possible de faire comme si 3% d'erreur en reconnaissance d'images c'est pareil que 30% à 40% en prévision de la récidive. Avec la loi actuelle un humain doit assumer la décision et, d'un point de vue éthique, il n'y a pas d'obligation de résultat mais une obligation de moyens et aussi de transparence sur la qualité de la décision. La quantification ou l'estimation statistique d'un taux d'erreur doit se substituer à un déterminisme binaire : vrai / faux irréaliste.
 
### 2.2 Mesurer la qualité d'une décision
Les différentes étapes de l'apprentissage supervisé sont [détaillées](https://github.com/wikistat/Apprentissage) et illustrées par ailleurs sur de nombreux cas d'usage. Les méthodes de prévisions sont entraînées sur les données d’apprentissage dont la qualité est déterminante. Les phases d'extraction, vérification, nettoyage, préparation des données sont critiques et doivent être conduites avec un soin particulier: *garbage in, garbage out*. Le volume des données peut être un facteur utile de qualité mais secondaire, seulement si celles-ci sont bien représentatives de l’objectif et pas biaisées. Dans le cas contraire des téraoctets de données n’améliorent en rien la qualité.

Les  stratégies d'apprentissage statistique sont par ailleurs rôdées et bien connues. L'objectif est d'optimiser le choix d'un algorithme afin, obligation de moyens, d'aboutir à la prévision minimisant un risque et ainsi à la meilleure décision. L'[estimation de l'erreur](http://wikistat.fr/pdf/st-m-app-risque.pdf) est donc intégrée à la démarche, il suffit de la faire connaître par souci de transparence.

Un pratique déontologique élémentaire consiste donc à associer chaque décision à une estimation statistique de la [qualité de prévision](http://wikistat.fr/pdf/st-m-app-risque.pdf) ou capacité de généralisation ou encore robustesse; la qualité est estimée sur un échantillon test indépendant.


## 3 Biais algorithmique et Discrimination
### 3.1 Contexte juridique
La loi française comme le règlement européen interdit toute forme de discrimination envers une personne ou un groupe mais, arriver à caractériser qu'une décision algorithmique est biaisée donc discriminatoire reste compliqué. Il est apparemment facile d’opérer individuellement du *testing* d’algorithme en modifiant la modalité de la variable sensible (femme en homme, noir en blanc, vieux en jeune...) d’une personne pour provoquer une éventuelle bascule de la décision, preuve de discrimination. Les exemples traités ci-dessous montrent les limites voire l'insuffisance d'une telle approche.

Comme le signale le rapport Villani (2018), il est important de  définir une notion de *discrimination envers un groupe*: le *discrimination impact assessment* ou *DIA*. C'est ce qui est pratiqué de longue date (1971) aux USA et reconnu dans certains cas par les tribunaux avec une approche statistique de la mesure de la discrimination à l'embauche ou pour l'accès au logement. Plusieurs indicateurs sont utilisables mais le plus employé et discuté considère la notion d'*effet disproportionné* (*disparate impact* ou *DI*). La variable sensible et protégée doit être connue (c'est le cas aux USA pour l'origine ethnique) pour estimer l'effet disproportionné mais celle-ci peut l'être sous une une forme cryptée ou en protégeant l'anonymat des personnes. 

Des biais, discriminations ou injustices ayant été identifiées, dans la base d'apprentissage et / ou dans la prévision, des outils statistiques et algorithmiques existent (*fair learning*) pour en corriger ou au mois en atténuer les effets. Si la base d'apprentissage est biaisée, ce qui est très généralement la source principale de discrimination, corriger le biais induit une forme de discrimination positive qui relève d'une décision politique, pas algorithmique.
 
### 3.2 Détecter un biais, une discrimination, la corriger
La première difficulté réside dans la façon de définir une discrimination, notamment d'un point de vue légal, puis de traduire cette définition en une quantité mesurable afin de construire des outils de détection. Suivant en cela Friedler et al. (2019) nous considérons qu'il n'est pas utile de multiplier les critères de détection de biais car beaucoup sont similaires et donc très corrélés entre eux. 

Trois niveaux de biais mesurés par des critères de plus en plus consensuels dans la communauté scientifique sont considérés:
- discrimination de groupe et effet disproportionné (*disparate impact* ou *DI*),
- comparaison des précisions ou taux d'erreur conditionnellement à la variable sensible,
- comparaison des taux de faux positifs ou faux négtifs conditionnellement à la variable sensible.

La phase suivante concerne la correction du biais dans le but d'éviter les sources de discrimination. Plusieurs stratégies sont comparées en exploitant les ressources disponibles en Python.

Ces différents points sont illustrés par des exemples, ou cas d'usage, sur des données publiques et sous la forme de tutoriels (*jupyter notebook*).

### 3.3 [Adult census](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/) 

Ce jeu de données est systématiquement utilisé pour illustrer des détections de biais et en comparer les corrections. Deux calepins sont proposés l'un en R se focalise sur la détection de biais et leur correction élémentaire, l'autre en python comparent les principaux algorthmes de correction.

### 3.4 [Propublica](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/Propublica/) 

Ce jeu de données recueilli et analysé par Angwin et al. (2017) est à l'origine de la controverse entre le site [Propublica](https://www.propublica.org/) et la société *equivant* qui commercialise le logiciel COMPAS produisant un score de récidive. Le tutoriel en R analyse les différents niveaux de biais présents tant les données puis dans le score de récidive COMPAS ou d'autres qui peuvent en découler.



### 4 Explicabilité (en chantier)
Une des principales sources de problèmes soulevés par l’IA réside dans l’opacité des algorithmes récents d’apprentissage statistique dont la complexité les rend impropres à une interprétation élémentaire comme c’est le cas d’un algorithme basé sur un modèle statistique linéaire ou un arbre de décision binaire. 

Le RGPD et plus précisément la loi française évoquent un « droit à l’explication » des décisions algorithmiques. Quelles aides peuvent être apportées en ce sens? La recherche est très active sur le sujet. L’objectif est d’en illustrer quelques pistes, notamment à l’aide de la librairie LIME sur des exemples. L’aide peut concerner une compréhension globale de l’algorithme (importance ou impact des variables, Bachoc et al. 2018) ou l’explication à un individu donné (counterfactual explanation, Watcher et al. 2018) : quelle modification de quelle variable conduirait à une décision favorable concernant l’accès à un crédit, un emploi... Il s'agit aussi d'identifier les variables ou facteurs qui influencent le plus et dans quel sens une décision pour qu'un humain, respectueux de la législation, en déduise des explications intelligibles adressées à la personne qui en fait la demande. 



## Références
- Angwin J., Larson J., Mattu S., Kirchner L. (2016). [How we analyzed the compas recidivism algorithm](https://www.propublica.org/article/how-we-analyzed-the-compas-recidivism-algorithm). ProPublica, en ligne consulté le 28/04/2017.
- Bachoc F., Gamboa F., Loubes J.-M., and Risser L. (2019). Entropic Variable Boosting for Explainability & Interpretability in Machine Learnings, [arXiv preprint](https://arxiv.org/pdf/1810.07924.pdf)
- Besse P. ,del Barrio E., Gordaliza P., Loubes J.-M. (2018-a). Confidence Intervals for testing Disparate Impact in Fair Learning, [arXiv preprint](https://arxiv.org/abs/1807.06362).
- Besse P., Castets-Renard C., Garivier A., Loubes J.-M. (2018-b). L'IA du Quotidien peut elle être Éthique?  Loyauté des Algorithmes d'Apprentissage Automatique, *Statistique et Société*, [à paraître](https://hal.archives-ouvertes.fr/hal-01886699v2).
- del Barrio E., Gamboa F., Gordaliza P., Loubes J.-M. (2018). Obtaining fairness using optimal transport theory, ICML 2019, [arXiv preprint](https://arxiv.org/pdf/1806.03195).
- Wachter S., Mittelstadt B., Russell C. (2018). Counterfactual Explanations without Opening the Black Box: Automated Decisions and the GDPR, Harvard Journal of Law & Technology, [arXiv](https://arxiv.org/abs/1711.00399).

