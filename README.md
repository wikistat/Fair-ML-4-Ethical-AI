<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/Logo_INSAvilletoulouse-RVB.png" style="float:left; max-width: 130px; display: inline" alt="INSA"/></a> 
<a href="http://www.univ-tlse3.fr/" ><img src="http://www.univ-tlse3.fr/medias/photo/ut3pres_logoq_1372757033342.jpg?ID_FICHE=49702" style="float:right; max-width: 250px; display: inline"  alt="insa"/></a>
<a href="http://wikistat.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/wikistat.jpg" style="float:right; max-width: 250px; display: inline"  alt="Wikistat"/></a> 
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
technologie... bref les débats de science fiction ou encore ceux anxiogènes: destruction des emplois même qualifiés, robots armés, big data big brother... 

### 1.2 IA, loi et usage éthique
Laissons à la CNIL les problèmes bien identifiés de *confidentialité des données*  et à l'Autorité de la Concurrrence ceux d’*entrave à la concurrence*. Nous nous focalisons sur les algorithmes d’apprentissage statistique, pour aborder les [Enjeux Ethiques de l’Algorithme et de l’Intelligence artificielle](https://www.cnil.fr/fr/comment-permettre-lhomme-de-garder-la-main-rapport-sur-les-enjeux-ethiques-des-algorithmes-et-de) (CNIL 2017) également très présents dans le [rapport Villani](https://www.aiforhumanity.fr/pdfs/9782111457089_Rapport_Villani_accessible.pdf) (2018, partie 5). 

De nombreux textes législatifs européens (RGPD avril 2018) et français récemment promulgués (juin 2018) tentent d’encadrer les usages de ces outils.  La mise en perspective détaillée de ces textes ([Besse et al. 2018-b](https://hal.archives-ouvertes.fr/hal-01886699v1)), face à la complexité et l’opacité des algorithmes d’apprentissage, révèle d’importantes disruptions technologiques. Ainsi, des vides juridiques  soulevent des problèmes ou risques sérieux lorsques des décisions, susceptibles d'impacter des personnes physiques ou même simplement de les profiler, sont le résultat de procédures algorithmiques exécutées sur des données personnelles. Seules des pratiques éthiques sont alors susceptibles de combler les lacunes pour palier ces problèmes.

### 1.3 Objectif
Le principal objectif du présent dépôt est de mettre à disposition des ressources pédagogiques (tutoriels) afin de *promouvoir des pratiques loyales et éthiques* indispensables au développement de la confiance des citoyens, justiciables, consommateurs, envers l'IA pour en faire accepter l'usage au quotidien.

Sur des cas d'usage bien identifiés, des tutoriels (*jupyter notebook*) permettent de poser concrètement les questions de loyauté des algorithmes et d'en évaluer les solutions récemment proposées et régulièrement mises à jour sur ce dépôt.

### 1.4 Environnement technique
Les outils sont déployés sous la forme de tutoriels: calepins ou *jupyter notenooks*. Des compléments d'informations sur les outils et algorithmes  sont à rechercher dans les autres tutoriels du dépôt [`github/wikistat`](https://github.com/wikistat). 

Le choix a été fait de développer les calepins avec le [langage R](https://github.com/wikistat/Intro-R) plus simple et plus intuitif que [Python](https://github.com/wikistat/Intro-Python). Les différentes librairies de R offrent de plus des aides à l'interprétation, notamment graphiques, statistiques, plus complètes et plus explicites que celles des librairies écrites en Python. Il serait néanmoins facile de transposer les outils proposés pour une exploitaiton plus efficace en Python.

<img src="https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F1a%2F17%2F95%2F1a1795bc25875e8644999af9534e34ab.jpg&sp=830af7d9d0d4008220ea00bc427d8062"
     style="float:center; max-width: 500px; display: inline"  alt="Wikistat" />Le Chat par Geluck<br>

## 2 Principes éthiques abordés ou non par la loi
Trois aspects majeurs sont à considérer et détaillés par [Besse et al. 2018-b](https://hal.archives-ouvertes.fr/hal-01886699v1)

### 2.1 Qualité des décisions algorithmiques
 Les algorithmes d'apprentissage ne sont pas prouvables, certifiables de façon déterministe comme des algorithmes procéduraux. Néanmoins, l'évaluation de la qualité d'une décision algorithmique est une question essentielle lorsqu'il s'agit, par exemple, de discuter de l'opportunité d'une opération chirurgicale ou encore de la libération conditionnelle d'un détenu. Malheureusement la loi est désespérément muette sur ce sujet et n'oblige en rien à la communication des estimations des qualités des prévisions conduisant aux décisions, comme c'est le cas pour un sondage d'opinion. Une loyauté élémentaire consiste donc à associer chaque décision à une estimation statistique de la [qualité de prévision](http://wikistat.fr/pdf/st-m-app-risque.pdf); qualité estimée  sur un échantillon test indépendant (capacité de généralisation). Il n'est pas possible de faire comme si 3% d'erreur en reconnaissance d'images c'est pareil que 30% à 40% en prévision de la récidive. Il faut sortir du déterminisme binaire : vrai / faux. Avec la loi actuelle un humain doit assumer la décision et, d'un point de vue éthique, il n'a pas obligation de résultat mais une obligation de moyens et aussi de transparence sur la qualité de la décision.

### 2.2 Discrimination et biais algorithmique
La loi française comme le règlement européen ne considère que la notion de discirmination envers une personne. Il est apparemment facile d’opérer individuellement du *testing* d’algorithme en modifiant la modalité de la variable sensible (femme en homme, noir en blanc, vieux en jeune...) d’une personne pour provoquer une éventuelle bascule et mettre en évidence le caractère dicriminatoire d'une décision. Malheureusement, de nombreux exemples montrent que, même protégée et absente des modèles, une information sensible est facilement déduite des autres informations ou variables disponibles. Le *testing* n'est pas probant alors que la discrimination est présente. Une approche basée sur la notion de discrimination individuelle est insuffisante. 

Comme le signale le rapport Villani (2018), il serait important de  définir une notion de discrimination (*discrimination impact assessment* ou DIA) envers un groupe. C'est ce qui est pratiqué de longue date (1971) aux USA et reconnu dans certains cas par les tribuanux avec une approche statistique de la mesure de la discrimination. Plusieurs indicateurs sont utilisables mais le plus employé et discuté considère la notion de d'*impact disproportionné* (*disparate impact*). A nouveau, la variable sensible et protégée doit être connue (c'est le cas aux USA) pour estimer l'impact disproportionné mais celle-ci peut l'être sous une une forme cryptée ou en protégeant l'anonymat des personnes (confidentialité k-différentielle). 

Des biais, discriminations ou injustices ayant été identifiées, dans la base d'apprentissage et / ou dans la prévision, des outils statistiques et algorithmiques existent (*fair learning*) pour en corriger ou au mois en atténuer les effets. Si la base d'apprentissage est biaisée, ce qui est très généralement la source principale de discrimination, corriger le biais induit une forme de discrimination positive qui relève d'une décision politique et humaine, pas algorithmique.
 
### 2.3 Droit à l'explication
Les algorithmes d'apprentissage statistique largement utilisés, quand ils sont les plus efficaces, sont généralement profondément opaques de même que les décisions qui en découlent sauf dans les cas de modèles statistiques ou arbres de décision élémentaires. Néanmoins, la recherche progresse pour apporter des aides à l'interprétation, pour aider à comprendre, au moins localement pour une personne impactée au sens de la loi, les raisons ou causes d'une décision algorithmique. Il s'agit par exemple d'identifier les variables ou facteurs qui influencent le plus et dans quel sens une décision pour qu'un humain, respectueux de la législation, en déduise des explications intelligibles adressées à la personne qui en fait la demande. 

Finalement, La résolution des questions de discrimination ou opacité d'un algorithme  est le résultat d'un compromis, si possible le meilleure, afin de réduire le biais ou améliorer l'expliquabilité d'une décision tout en évitant de trop en dégrader la qualité. Ces points seront abordés en pratique dans les sections suivantes. 

## 3 Pratiques loyales
### 3.1 Mesurer la qualité d'une décision

Les  stratégies d'apprentissage sont rôdées et bien connues. L'objectif est d'optimiser le choix dun algorithme afin, obligation de moyen, d'aboutir à la prévision minimisant un risque et donc à la meilleure décision. L'[estimation de l'erreur](http://wikistat.fr/pdf/st-m-app-risque.pdf) est donc intégrée à la démarche, il suffit de la faire connaôitre par souci de transparence.

Les difféentes étapes de l'apprentissage supervisé sont détaillées et  [illustrées par ailleurs](https://github.com/wikistat/Apprentissage) sur de nombreux cas d'usage.

Les méthodes de prévisions sont entraînées sur les données d’apprentissage dont la qualité est déterminante. Les phases d'extraction, vérification, nettoyage, préparation des données sont critiques et doivent être conduites avec un soin particulier: *garbage in, garbage out*. Le volume des données peut être un facteur utile de qualité mais secondaire, seulement si celles-ci sont bien représentatives de l’objectif et pas biaisées. Dans le cas contraire des téraoctets n’y font rien.
 
### 3.2 Détecter un biais, une discrimination
La première difficulté réside dans la façon de définir une dicrimination, notamment d'un point de vue légal, puis de traduire cette défition en une quantité mesurable afin de construire des outils de détection. Ces différents points sont illustrés par deux exemples ou cas d'usage:

- [Adult census](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/Adult-R-FairDataAnalysis.ipynb) Analyse loyale d'un jeu de données. Epxloration et  détection d'une discrimination individuelle par *testing* ou de groupe par estimation d'un impact disproportionné: *disparate impact* (DI) estimatIon par intervalle de confiance [(Besse et al. 2018-a)](https://arxiv.org/abs/1807.06362). Biais de la base d'apprentissage et biais des prévisions.
- [Propublica](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/Propublica/CompasDisparate.ipynb) 

###  3.3 Correction d'une discrimination
Illustration de [del Barrio et al. (2018)](https://arxiv.org/pdf/1806.03195)... En chantier.

### 3.4 Droit à l'explication
Illustration de [Bachoc et al. (2019)]()... En chantier.

## Références
- Bachoc, F, Gamboa, F., Loubes, J-M. and Risser, L (2019). Sensitivity  Analysis for Explainable & Intepretable Machine Learning Algorithms, work in progress.
- Besse P. del Barrio E., Gordaliza P., Loubes J.-M. (2018-a). Confidence Intervals for testing Disparate Impact in Fair Learning, soumis, [arXiv preprint](https://arxiv.org/abs/1807.06362).
- Besse P., Castets-Renard C., Garivier A., Loubes J.-M. (2018-b). L'IA du Quotidien peut elle être Éthique?  Loyauté des Algorithmes d'Apprentissage Automatique, *Statistique et Société*, à paraître, [HAL preprint](https://hal.archives-ouvertes.fr/hal-01886699v1).
- del Barrio E., Gamboa F., Gordaliza P., Loubes J.-M. (2018). Obtaining fairness using optimal transport theory, soumis, [arXiv preprint](https://arxiv.org/pdf/1806.03195).

