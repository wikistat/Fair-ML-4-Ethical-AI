<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/Logo_INSAvilletoulouse-RVB.png" style="float:left; max-width: 130px; display: inline" alt="INSA"/></a> 
<a href="http://www.univ-tlse3.fr/" ><img src="http://www.univ-tlse3.fr/medias/photo/ut3pres_logoq_1372757033342.jpg?ID_FICHE=49702" style="float:right; max-width: 250px; display: inline"  alt="insa"/></a>
<a href="http://wikistat.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/wikistat.jpg" style="float:right; max-width: 250px; display: inline"  alt="Wikistat"/></a>

# Apprentissage Statistique Loyal pour IA Ethique: outils pédagogique

## *Fair Machine Learning for Ethical AI: educational resources*


#### Philippe Besse(1) et Jean-Michel Loubes(2)

(1) Université de Toulouse -- INSA

(2) Université de Toulouse -- Paul Sabatier

## 1 Introduction
### 1.1 Cadre général
Associant données massives (*big data*) et algorithmes d’[apprentissage automatique](https://github.com/wikistat/Apprentissage) (*machine learning*), la puissance des outils de décision automatique suscite autant d’espoir que de craintes. De nombreux textes législatifs européens (RGPD) et français récemment promulgués tentent d’encadrer les usages de ces outils. Laissant de côté les problèmes bien identifiés par la CNIL de *confidentialité des données*  et ceux d’*entrave à la concurrence*, nous nous focalisons sur les outils relatifs aux questions éthiques soulevées dans le rapport: [Enjeux Ethiques de l’Algorithme et de l’Intelligence artificielle](https://www.cnil.fr/fr/comment-permettre-lhomme-de-garder-la-main-rapport-sur-les-enjeux-ethiques-des-algorithmes-et-de) (15/12/2017) de la CNIL ou encore dans le [rapport Villani](https://www.aiforhumanity.fr/pdfs/9782111457089_Rapport_Villani_accessible.pdf) (2018, partie 5).

 La mise en perspective détaillée des textes juridiques ([Besse et al. 2018-b](https://hal.archives-ouvertes.fr/hal-01886699v1)), face à la complexité et l’opacité des algorithmes d’apprentissage, révèle d’importantes disruptions technologiques soulevant des problèmes ou risques sérieux lorsques des décisions, susceptibles d'impacter des personnes physiques ou même simplement de les profiler, sont le résultat de procédures algorithmiques exécutées sur des données personnelles. Trois questions sont à prendre en compte:
 
- **qualité** des décisions algorithmiques et erreur de prévision;
- risque de **discrimination** et biais des algorithmes;
- droit à l'**explication**  et transparence.


### 1.2 Objectifs

Ce dépôt regroupe des outils poursuivant plusieurs objectifs mais principalement, il s'agit d'illuster sur des *cas d'usage concrets, réalistes et pédagogiques* les questions éthiques soulevées par l'usage d'algorithmes d'apprentissage ainsique que les outils statistiques permettant: 

- de détecter la présence de biais et donc des sources de discrimination
   - dans une base d'apprentissage,
   - dans une décision algorithmique apprise sur cette base;
- d'évaluer les stratégies de correction d'un biais dans un objectif d'apprentissage loyal (*fair learning*) pour réduire cette discirmination ou opérer une discrimination positive;
- de fournir des aides à l'interprétation d'un algorithme opaque dans l'objectif de pouvoir répondre à des *demandes d'explication*.

*Il s'agit finalement d'illustrer en pratique et de façon pédagogique les réflexions de [Besse et al. (2018-b)](https://hal.archives-ouvertes.fr/hal-01886699v1) sur ces questions*. 

### 1.3 Cadre technique
Les outils sont déployés sous la forme de tutoriels: calepins ou *jupyter notenooks*. Des compléments d'informations sur les outils et algorithmes utilisés sont à rechercher dans les autres tutoriels du dépôt [`github/wikistat`](https://github.com/wikistat). 

Le choix a été fait de développer les calepins avec le [langage R](https://github.com/wikistat/Intro-R) plus simple et plus intuitif que [Python](https://github.com/wikistat/Intro-Python). Les différentes librairies de R offrent de plus des aides à l'interprétation, notamment graphiques, statistiques, plus complètes et plus explicites que celles des librairies écrites en Python. Il serait néanmoins facile de transposer les outils proposés pour une exploitaiton efficace en Python.

## 2. Qualité d'une décision algorithmique
### 2.1 Qualité et erreur de prévision
En apprentissage statistique, la justesse de la décision dépend de la [qualité d’une prévision](http://wikistat.fr/pdf/st-m-app-risque.pdf) et donc de la qualité d’un modèle ou d’un algorithme. Cette dernière dépend de la représentativité ou biais des données initiales, de l’adéquation du modèle au problème posé et dela quantité (variance) de bruit résiduel. Elle est [évaluée](http://wikistat.fr/pdf/st-m-app-risque.pdf) sur un échantillon test indépendant ou par validation croisée (Monte Carlo) mais reste indicative sous la forme d’un risque probabiliste d’erreur.

Les méthodes de prévisions sont entraînées sur les données d’apprentissage, c’est donc la qualité de celles-ci qui est en premier lieu déterminante ; rappelons le vieil adage : *garbage in, garbage out*. Leur volume peut être un facteur utile de qualité mais seulement si les données sont bien représentatives de l’objectif et pas biaisées. Dans le cas contraire des téraoctets n’y font rien.

### 2.2 Qualité, textes de loi et éthique
L'évaluation de la qualité d'une décision algorithmique est une question essentielle lorsqu'il s'agit, par exemple, de discuter de l'opportunité d'une opération chirurgicale ou encore de la libération conditionnelle d'un détenu. Malheureusement la loi est désespérément muette sur ce sujet et n'oblige en rien à la communication des estimations des qualités des prévisions conduisant aux décisions, comme c'est le cas pour un sondage d'opinion. D'un point de vue éthique et pour pallier les insuffisances de la législation, il n'y a pas d'*obligation de résultat* mais en revanche une *obligation de moyens*; mettre en oeuvre la méthode la plus adaptée pour atteindre les qualités optimales de résultat. 

### 2.3 Discrimination, explicabilité et qualité
La résolution des questions de discrimination ou opacité d'un algorithme  est le résultat d'un compromis, si possible le meilleure, afin de réduire le biais ou améliorer l'expliquabilité d'une décision tout en évitant de trop en dégrader la qualité. Ces points seront traités dans les sections suivantes. 

## 3 Détection d'une discrimination
La première difficulté réside dans la façon de définir une dicrimination, notamment d'un point de vue légal, puis de traduire cette défition en une quantité mesurable afin de construire des outils de détection. Ces différents points sont illustrés par deux exemples ou cas d'usage:

- [Adult census]() Analyse loyale d'un jeu de données. Epxloration et  détection d'une discrimination individuelle par *testing* ou de groupe par estimation d'un impact disproportionné: *disparate impact* (DI) estimatIon par intervalle de confiance [(Besse et al. 2018-a)](https://arxiv.org/abs/1807.06362). Biais de la base d'apprentissage et biais des prévisions; débiaisage naïf.
- [Propublica]() 

## 4 Correction d'une discrimination
Illustration de [del Barrio et al. (2018)](https://arxiv.org/pdf/1806.03195).

## 5 Droit à l'explication
Illustration de [Bachoc et al. (2018)]()... En chantier.

## Références
- Bachoc, F, Gamboa, F., Loubes, J-M. and Risser, L (2018). Sensitivity  Analysis for Explainable & Intepretable Machine Learning Algorithms. work in progress.
- Besse P. del Barrio E., Gordaliza P., Loubes J.-M. (2018-a). Confidence Intervals for testing Disparate Impact in Fair Learning, soumis, [arXiv preprint](https://arxiv.org/abs/1807.06362).
- Besse P., Castets-Renard C., Garivier A., Loubes J.-M. (2018-b). L'IA du Quotidien peut elle être Éthique?  Loyauté des Algorithmes d'Apprentissage Automatique, *Statistique et Société*, à paraître, [HAL preprint](https://hal.archives-ouvertes.fr/hal-01886699v1).
- del Barrio E., Gamboa F., Gordaliza P., Loubes J.-M. (2018). Obtaining fairness using optimal transport theory, soumis, [arXiv preprint](https://arxiv.org/pdf/1806.03195).

