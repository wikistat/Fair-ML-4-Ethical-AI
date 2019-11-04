


<a href="http://www.univ-tlse3.fr/" ><img src="https://www.actuia.com/wp-content/uploads/2019/07/logo_ANITI1-696x348.jpg"  height="75"  alt="insa"/></a>

<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/Logo_INSAvilletoulouse-RVB.png" style="float:right; max-width: 200px; display: inline" alt="INSA"/> 



# Apprentissage Statistique Légal pour IA Éthique
## Ressources pédagogiques

## *Legal Statistical Learning for Ethical AI*: *Educational resources*


#### [Philippe Besse](https://www.math.univ-toulouse.fr/~besse/) (1), [Céline Castets Renard](https://www.castetsrenard.org/) (2), [Jean-Michel Loubes](https://perso.math.univ-toulouse.fr/loubes/)(3) & [Laurent Risser](http://laurent.risser.free.fr/) (4)

(1) Université de Toulouse -- INSA

(2) Université d'Ottawa & [ANITI](https://aniti.univ-toulouse.fr/)

(3) Université de Toulouse -- Paul Sabatier & [ANITI](https://aniti.univ-toulouse.fr/)

(4) IMT - CNRS & [ANITI](https://aniti.univ-toulouse.fr/)

## 1 Introduction
### 1.1 IA au quotidien et apprentissage statistique
Associant données massives (*big data*) et algorithmes d’[apprentissage automatique](https://github.com/wikistat/Apprentissage) (*machine learning*), la puissance des outils de décision automatique suscite autant d’espoir que de craintes. Ces algorithmes, acteurs  de l'Intelligence Artificielle (IA) au quotidien, construisent des décisions issues de prévisions obtenues après estimation ou entraînement sur une base de données personnelles: attribution d'un crédit et prévision du risque de mauvais paiement; profilage et publicité en ligne; prime d'assurance auto et conduite accidentogène; imagerie médicale et détection de tumeurs; passé comportemental, environnement social et risque de récidive... 

Laissons de côté les effets médiatiques rabâchés : véhicule autonome devant choisir entre un landau et un fauteuil roulant, robot humanoïde affectueux, lois d'Azimov de la robotique, transhumanisme, singularité
technologique... bref les débats de science fiction ou encore ceux sociétaux anxiogènes: destruction des emplois même qualifiés, robots armés, *big data big brother*... 

### 1.2 IA, usage éthique & légal
Laissons à la CNIL les problèmes bien identifiés de *confidentialité des données*  et à l'Autorité de la Concurrrence ceux d’*entrave à la concurrence*. Nous nous focalisons sur les usages des algorithmes d’*apprentissage statistique*, pour aborder les 

- [Enjeux Éthiques de l’Algorithme et de l’Intelligence artificielle](https://www.cnil.fr/fr/comment-permettre-lhomme-de-garder-la-main-rapport-sur-les-enjeux-ethiques-des-algorithmes-et-de) (CNIL 2017) également très présents dans le 
- [rapport Villani](https://www.aiforhumanity.fr/pdfs/9782111457089_Rapport_Villani_accessible.pdf) (2018, partie 5), la
- [Déclaration de Montréal pour un développement responsable de l'IA](https://docs.wixstatic.com/ugd/ebc3a3_4272febbb17e42edb1d774e1e7339699.pdf) (2018) qui cite par ailleurs pas moins de 28 rapports nationaux ou professionnels et 
- [Ethics Guidelines for Trustworthy AI
Independant high-level expert group on Artificial Intelligence set up by the European Commission (2019)](https://ec.europa.eu/futurium/en/ai-alliance-consultation).

[Fjeld et al. (2019)](https://ai-hr.cyber.harvard.edu/primp-viz.html) proposent une analyse sémantique et graphique de tous ces guides, rapports, chartes, déclarations, qui résume bien les tentatives ou bonnes intentions pour construire une IA basée sur des principes éthiques afin de conquérir la confiance des usagers qu'ils soient consommateurs, clients, patients, contribuables, justiciables ou citoyens. C'est l'*acceptabilité* des algorithmes d'Intelligence Artificielle qui est en jeu. L'équation est assez simple, en l'absence de confiance, pas d'utilisateurs donc pas de données et finalement pas d'IA et pas de bénéfices. Les conséquences de l’affaire *Cambridge Analytica* sur l’encours boursier de Facebook en fut une démonstration éclatante en juillet 2018.

Cette affaire comme toutes celles qui éclatent régulièrement : trois condamnations successives de Google pour entrave à la concurrence, fuites répétées de données personnelles, utilisations abusives de celles-ci, nous rappellent que le but premier des entreprises commerciales n’est pas l’altruisme ou la philanthropie mais le montant des dividendes de leurs actionnaires. Ces derniers nécessitent certes des pratiques éthiques pour être acceptables mais la confiance sera nettement plus fiable si celle-ci repose sur une protection juridique plutôt que de bonnes intentions éthiques.

De nombreux textes législatifs européens (RGPD avril 2018) et français (trois lois informatique et liberté, décrets d'application, codes civils de la Santé publique, des administrations, décisions du Conseil Constituitonnel)  tentent d’encadrer les usages de ces outils.  La mise en perspective détaillée de ces textes ([Besse et al. 2018-b](http://statistique-et-societe.fr/article/view/719)), face à la complexité et l’opacité des algorithmes d’apprentissage ou aux disruptions technnologiques, révèle des failles ou des difficultés réelles d'application de la loi. Ces vides juridiques  soulèvent des problèmes ou risques sérieux lorsques des décisions, susceptibles d'impacter des personnes physiques ou même simplement de les profiler, sont le résultat de procédures algorithmiques exécutées sur des données personnelles. 


### 1.3 Objectif
Le principal objectif du présent dépôt est de mettre à disposition des ressources pédagogiques (tutoriels) afin de *promouvoir des mises en oeuvre légales et en conséquence éthiques* des algorithmes d'apprentissage automatique. Plus précisément, il s'agit de proposer des outils, indicateurs, fonctionnalités, permettant de valider la conformité des usages  algorithmiques au regard de la loi. 

Sur des cas d'usage bien identifiés, des tutoriels (*jupyter notebook*) permettent de poser concrètement les questions de légalité des algorithmes et d'en évaluer les solutions récemment proposées et régulièrement mises à jour sur ce dépôt. Plus précisément il s'agit de détailler le fonctionnement d'outils et critères, généralement statistiques,  de détection de pratiques illégales, éventuellement de corrections et également d'aide à l'explication de décisions algorithmiques comme le voudrait la loi.

Ces outils sont ceux suceptibles d'être intégrés à une *procédure d'audit* des algorithmes d'apprentissage dont la mise en place est demandée par la plupart des rapports dont celui de VIllani (2018) cités ci-dessus et appelant à un *bon usage* de l'IA.

### 1.4 Environnement technique
Les outils sont déployés sous la forme de tutoriels: calepins ou *jupyter notebooks*. Des compléments d'informations sur les outils et algorithmes  sont à rechercher dans les autres tutoriels du dépôt [`github/wikistat`](https://github.com/wikistat). 

Le choix a été fait de développer les calepins avec les langages [R](https://github.com/wikistat/Intro-R) ou [Python](https://github.com/wikistat/Intro-Python); R plus simple et intuitif propose de nombreuses librairies facilitant les aides à l'interprétation, notamment graphiques et statistiques. En revanche Pyhton s'avère souvent plus efficace et reste un outil de référence dans la communauté numérique du *fair learning*. Il permet des développements plus opérationnels.

<img src="https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F1a%2F17%2F95%2F1a1795bc25875e8644999af9534e34ab.jpg&sp=830af7d9d0d4008220ea00bc427d8062"
     style="float:center; max-width: 500px; display: inline"  alt="LeChat" /><i>Le Chat par Philippe Geluck</i><br>

Trois aspects majeurs sont à considérer et détaillés par [Besse et al. 2018-b](https://hal.archives-ouvertes.fr/hal-01886699)


## 2 Biais algorithmique et Discrimination
### 2.1 Contexte juridique
La loi française comme le règlement européen interdit toute forme de discrimination envers une personne ou un groupe mais, arriver à caractériser qu'une décision algorithmique est biaisée donc discriminatoire reste compliqué. Il est apparemment facile d’opérer individuellement du *testing* d’algorithme en modifiant la modalité de la variable sensible (femme en homme, noir en blanc, vieux en jeune...) d’une personne pour provoquer une éventuelle bascule de la décision, preuve d'une discrimination individuelle. Les exemples traités ci-dessous montrent les limites voire l'insuffisance d'une telle approche pour aborder la dicrimination envers un groupe.

Comme le signale le rapport Villani (2018), il est important de pouvoir définir une mesure de *discrimination envers un groupe*: le *discrimination impact assessment* ou *DIA*. C'est ce qui est pratiqué de longue date (1971) aux USA et reconnu dans certains cas par les tribunaux avec une approche statistique de la mesure de la discrimination à l'embauche ou pour l'accès au logement. Plusieurs indicateurs sont utilisables mais le plus employé et discuté considère la notion d'*effet disproportionné* (*disparate impact* ou *DI*). La variable sensible et protégée doit être connue (c'est le cas aux USA pour l'origine ethnique) pour estimer l'effet disproportionné mais celle-ci peut l'être sous une une forme cryptée ou en protégeant l'anonymat des personnes. 

Des biais, discriminations ou injustices ayant été identifiées, dans la base d'apprentissage et / ou dans la prévision, des outils statistiques et algorithmiques existent (*fair learning*) pour en corriger ou au mois en atténuer les effets. Si la base d'apprentissage est biaisée, ce qui est très généralement la source principale de discrimination, corriger le biais induit une forme de discrimination positive qui relève d'une décision politique, pas algorithmique.
 
### 2.2 Détecter un biais, une discrimination, la ou les corriger
La première difficulté réside dans la façon de définir une discrimination, notamment d'un point de vue légal, puis de traduire cette définition en une quantité mesurable afin de construire des outils de détection. Suivant en cela Friedler et al. (2019) nous considérons qu'il n'est pas utile de multiplier les critères de détection de biais car beaucoup sont similaires et donc très corrélés entre eux. 

Trois niveaux de biais mesurés par des indicateurs de plus en plus consensuels dans la communauté scientifique sont considérés:

- discrimination de groupe et effet disproportionné: *disparate impact* (*DI*) ou *demographic equality*,
- comparaison des précisions ou taux d'erreur conditionnellement à la variable sensible: *overall error equality*,
- comparaison des taux de faux positifs et vrais négatifs conditionnellement à la variable sensible: *equality of odds*

Tous ces niveaux de biais sont caractérisés par des indicateurs dont l'estimation est proposée par des intervalles de confiance (Besse et al. 2018) afin d'en contrôler la précision.

La phase suivante concerne la correction du biais dans le but d'éviter les sources de discrimination. Plusieurs stratégies sont comparées en exploitant les ressources disponibles en Python.

Ces différents points sont illustrés par des exemples, ou cas d'usage, sur des données publiques et sous la forme de tutoriels (*jupyter notebook*).

### 2.3 Cas d'usage: [Adult census](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/) 
1. Ces données de sondage présentent des biais sociologiques attendus vis-à-vis des groupes de genre et d'origine ethnique. Le biais, mesuré par l'effet disproportionné (*Disparate impact* ou *DI*), est nettement plus marqué conditionnellement au genre.
2. Une prévision du seuil avec un algorithme d'apprentissage reproduit voire amplifie ce biais: le *DI* décroît. C'est même statistiquement significatif pour le genre avec la régression logistique linéaire (sans interaction): intervalles de confiance du *DI* disjoints; c'est plus modéré pour l'origine. *Un modèle linéaire opère une discrimination conditionnellement au genre*. 
3. *Comme la précision, l'augmentation du biais dépend de l'algorithme opéré*. Sur ces points, les forêts aléatoires sont plus performantes que la régression logistique, sur-biaisent moins mais sont opaques à une interprétation. 
4. L'itération de la séparation aléatoire des échantillons apprentissage / test par validation croisée *Monte Carlo* révèle une instabilité importante de l'estimation du *DI*, même sur une relativement grosse base de données, mais confirme l'effet discriminatoire des algorithmes. Ceci souligne et valide l'importance d'une estimation du *DI* par intervalle de confiance.
5. La détection d'une discrimination individuelle par *testing* montre que peu de femmes ou de non-caucasiens pourraient se déclarer discriminés par la prévision et être donc en mesure, individuellement, de porter plainte. Cette mesure individuelle de la discrimination, est finalement assez annecdotique au regard de la mesure de discrimination de groupe; autrement dit, sur cet exemple, *une mesure individuelle de la discrimination par testing minimise son importance*. 
6. Corriger la prévision pour attribuer la prévision la plus favorable quel que soit la modalité sensible, permet à une entreprise ou administration d'échapper à une investigation par *testing* mais ne fait en rien décroîte le biais (accroître le *DI*) donc la discrimination de groupe. Ce serait une *pratique tout à fait déloyale, voire condamnable*.
7. La suppression des variables sensibles de la prévision ne change rien aux points 2 et 3 précédents. C'est une *procédure naïve et inefficace pour corriger le *DI* donc un biais de groupe*.
8. **Résultat important** à évaluer sur d'autres sources de données: une façon simple d'éviter des décisions discriminatoires, mais sans toucher au biais de société, consiste à opérer des algorithmes  *non linéaires* (arbre, forêt), *un pour chaque modalité* de la variable sensible.
9. Les taux d'erreurs conditionnels aux variables sensibles sont assez différents; une estimation par intervalle de confiance serait bienvenue. *L'accroissement de l'erreur est dans ce cas au détriment de la classe majoritaire* et se retrouve pour tous les algorithmes linéaires ou non.
10. Après l'effet disproportionné (*DI*) et les taux d'erreur conditionnels, il est important de considérer les éventuelles *asymétries des matrices de confusion conditionnelles* (*equality of odds*) aux variables sensibles. Le rapport des taux de faux positifs conditionnels ainsi que celui des taux de faux négatifs conditionnels témoignent de différences de traitement marqués relativement aux groupes. Pour la régression logistique, Les taux d'erreurs sont effectivement importants pour les hommes mais c'est finalement à leur avantage car le *taux de faux positifs est significativement plus important les concernant au contraire des taux de faux négatifs plus importants pour les femmes*. En cas d'erreur celle-ci est donc en moyenne au profit des hommes; ce phénomène est moins marqué conditionnellement à l'origine ethnique. 
11. **Suite**: Comme pour le *DI*, l'*association de deux algorihtmes non linéaires* (arbre ou forêt) ne corrige pas le biais sur les taux d'erreur mais semble le corriger sur les taux de faux positifs et faux négatifs conditionnels. 
12. En France, comme en Europe, il y a une part d'hypocrisie à interdire l'enregistrement d'une variable sensible. Certes, cela protège la confidentialité des personnes mais empêche aussi de mettre simplement en évidence biais et discriminations des traitements vis-à-vis d'un groupe ou des individus. 
13. Une pratique parfois jugée déloyale et qui consiste à adapter le seuil de décision de la prévision, le baisser pour le groupe à protéger, réduit significativement le biais pour le *rendre similaire à celui de la base d'entraînement*; il n'y a plus discrimination de groupe. La procédure qui consisterait à réduire plus le seuil pour corriger le biais de société revient à introduire une discrimination positive. Il s'agit d'un choix politique et non plus statistique. Dans ce cas, l'erreur de prévision se dégrade. D'autres corrections de biais en contrôlant l'erreur de prévision sont à considérer pour conduire à de l'*apprentissage loyal* et donc à une *IA éthique*. C'est l'objet d'un autre tutoriel en python.
14. Les autres indicateurs de biais: *overall error equality*, *odds equlity*


### 3 Explicabilité (en chantier)
Une des principales sources de problèmes soulevés par l’IA réside dans l’opacité des algorithmes récents d’apprentissage statistique dont la complexité les rend impropres à une interprétation élémentaire comme c’est le cas d’un algorithme basé sur un modèle statistique linéaire ou un arbre de décision binaire. 

Le RGPD et plus précisément la loi française évoquent un « droit à l’explication » des décisions algorithmiques. Quelles aides peuvent être apportées en ce sens? La recherche est très active sur le sujet. L’objectif est d’en illustrer quelques pistes, notamment à l’aide de la librairie LIME sur des exemples. L’aide peut concerner une compréhension globale de l’algorithme (importance ou impact des variables, Bachoc et al. 2018) ou l’explication à un individu donné: quelle modification de quelle variable conduirait à une décision favorable concernant l’accès à un crédit, un emploi... Il s'agit aussi d'identifier les variables ou facteurs qui influencent le plus et dans quel sens une décision pour qu'un humain, respectueux de la législation, en déduise des explications *intelligibles* adressées à la personne qui en fait la demande. 

## 4 Qualité des décisions algorithmiques
### 4.1 Contexte déontologique
Les algorithmes d'apprentissage ne sont pas prouvables, certifiables de façon déterministe comme des algorithmes procéduraux. Néanmoins, l'évaluation de la qualité d'une décision algorithmique est une question essentielle lorsqu'il s'agit, par exemple, de discuter de l'opportunité d'une opération chirurgicale ou encore de la libération conditionnelle d'un détenu. Malheureusement la loi est muette sur ce sujet et n'oblige en rien à la communication des estimations des qualités des prévisions conduisant aux décisions, comme c'est le cas pour un sondage d'opinion. 

Il n'est pas possible de faire comme si 3% d'erreur en reconnaissance d'images c'est pareil que 30% à 40% en prévision de la récidive. Avec la loi actuelle un humain doit assumer la décision et, d'un point de vue éthique, il n'y a pas d'obligation de résultat mais une obligation de moyens et aussi de transparence sur la qualité de la décision. La quantification ou l'estimation statistique d'un taux d'erreur doit se substituer à un déterminisme binaire : vrai / faux irréaliste.
 
### 4.2 Mesurer la qualité d'une décision
Les différentes étapes de l'apprentissage supervisé sont [détaillées](https://github.com/wikistat/Apprentissage) et illustrées par ailleurs sur de nombreux cas d'usage. Les méthodes de prévisions sont entraînées sur les données d’apprentissage dont la qualité et la représentativité sont déterminantes. Les phases d'extraction, vérification, nettoyage, préparation des données sont critiques et doivent être conduites avec un soin particulier: *garbage in, garbage out*. Le volume des données peut être un facteur utile de qualité mais secondaire, seulement si celles-ci sont bien représentatives de l’objectif et pas biaisées. Dans le cas contraire des téraoctets de données n’améliorent en rien la qualité.

Les  stratégies d'apprentissage statistique sont par ailleurs rôdées et bien connues. L'objectif est d'optimiser le choix d'un algorithme afin, obligation de moyens, d'aboutir à la prévision minimisant un risque et ainsi à la meilleure décision. L'[estimation de l'erreur](http://wikistat.fr/pdf/st-m-app-risque.pdf) est donc intégrée à la démarche, il suffit de la faire connaître par souci de transparence.

Un pratique déontologique élémentaire consiste donc à associer chaque décision à une estimation statistique de la [qualité de prévision](http://wikistat.fr/pdf/st-m-app-risque.pdf) (*accuracy*) ou capacité de généralisation ou encore robustesse; la qualité est estimée sur un *échantillon test indépendant*.


## Références
- Angwin J., Larson J., Mattu S., Kirchner L. (2016). [How we analyzed the compas recidivism algorithm](https://www.propublica.org/article/how-we-analyzed-the-compas-recidivism-algorithm). ProPublica, en ligne consulté le 28/04/2017.
- Bachoc F., Gamboa F., Loubes J.-M., and Risser L. (2019). Entropic Variable Boosting for Explainability & Interpretability in Machine Learnings, [arXiv preprint](https://arxiv.org/pdf/1810.07924.pdf)
- Besse P. ,del Barrio E., Gordaliza P., Loubes J.-M. (2018-a). Confidence Intervals for testing Disparate Impact in Fair Learning, [arXiv preprint](https://arxiv.org/abs/1807.06362).
- Besse P., Castets-Renard C., Garivier A., Loubes J.-M. (2018-b). L'IA du Quotidien peut elle être Éthique?  Loyauté des Algorithmes d'Apprentissage Automatique, *Statistique et Société*, [Vol. 6 N°3](http://statistique-et-societe.fr/article/view/719).
- del Barrio E., Gamboa F., Gordaliza P., Loubes J.-M. (2018). Obtaining fairness using optimal transport theory, ICML 2019, [arXiv preprint](https://arxiv.org/pdf/1806.03195).
