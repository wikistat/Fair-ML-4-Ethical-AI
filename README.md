<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/logo-insa.jpg" height="100"  alt="INSA"/></a> 
<a href="https://observatoire-ia.ulaval.ca/" ><img src="https://b-com.com/sites/default/files/observatoire-logo_complet-couleurs-texte_droite%20copie-01.jpg" height="150" alt="ObvIA"/></a> 
<a href="https://aniti.univ-toulouse.fr/" ><img src="https://www.actuia.com/wp-content/uploads/2019/07/logo_ANITI1-696x348.jpg" height="100" alt="ANITI"/></a> 
# Evaluation des Risques des Impacts Sociétaux des Algorithmes d'IA: ressources pédagogiques


#### [Philippe Besse](https://www.math.univ-toulouse.fr/~besse/) (1), [Céline Castets Renard](https://www.castetsrenard.org/) (2), [Jean-Michel Loubes](https://perso.math.univ-toulouse.fr/loubes/)(3) & [Laurent Risser](http://laurent.risser.free.fr/) (4)

(1) Université de Toulouse -- INSA & [ObvIA](https://observatoire-ia.ulaval.ca/)

(2) Université d'Ottawa, [ANITI](https://aniti.univ-toulouse.fr/), & [ObvIA](https://observatoire-ia.ulaval.ca/)

(3) Université de Toulouse -- Paul Sabatier & [ANITI](https://aniti.univ-toulouse.fr/)

(4) IMT - CNRS & [ANITI](https://aniti.univ-toulouse.fr/)

**Résumé**

Faisant suite au déploiement du RGPD, la Commission Européenne a publié en février 2020 un livre blanc pour une [approche de l'IA basée sur l'excellence et la confiance](https://ec.europa.eu/info/sites/info/files/commission-white-paper-artificial-intelligence-feb2020_fr.pdf) et dont les recommandations sont largement issues du [guide pour une IA digne de confiance](https://ec.europa.eu/futurium/en/ai-alliance-consultation) rédigé en 2018-2020 par un groupe d'experts européens. Au delà des questions prioritaires de protection des données au cœur des missions de la CNIL, ce livre blanc soulève avec insistance d'autres questions relatives aux risques des impacts des algorithmes d'apprentissage automatique sur notre société: qualité, précision et robustesse des décisions algorithmiques, opacité et explicabilité, biais et discriminations. Il annonce la publication d'une nouvelle règlementation européenne afin de favoriser le développement d'une IA digne de confiance basée sur la production, par les responsables d'un système d'intelligece artificielle (SIA), d'une *liste d'évaluation* documentant précisément son fonctionnement, l'évaluation des risques encourus et les mesures prises pour y remédier. L'objectif de ce dépôt est de présenter quelques ressources pédagogiques afin d'anticiper la production d'une telle documentation. Les questions de qualité et précision des algorithmes, leur explicabilité, sont évoquées avant de se focaliser sur les risques de biais et discrimination. Les principaux indicateurs de biais algorithmiques, dont l'effet disproportionné (*disparate impact*), sont définis et les procédures de calcul détaillées dans un  [tutoriel en R](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb). Leur usage est illustré  sur un exemple concret analogue au calcul d'un score de crédit en intégrant une procédure rudimentaire d'atténuation de biais donc de discrimination.

## 1 Introduction
### 1.1 IA post RGPD éthique et/ou légale 
La publication du RGPD (2018) et son intégration dans les lois nationales a considérablement impacté la gestion des données dont celles impliquant es personnes physiques. La CNIL a pour mission de s'assurer que ce réglement est correctement appliqué et fournit les outils permettant l'[évaluation de l'impact sur la vie privée](https://www.cnil.fr/fr/gerer-les-risques): *privacy impact assessment (PIA)*. Par ailleurs, l'Autorité de la Concurrrence traque les risques d’*entrave à la concurrence*: moteurs de recherche, sites de comparateurs de prix, *pricing* automatique.

Le considérant (71) du RGPD (2018) recommande:

- [...] Afin d’assurer un traitement équitable et transparent à l’égard de la personne concernée, [...] le responsable du traitement **devrait** utiliser des *procédures mathématiques ou statistiques* adéquates aux fins du profilage, appliquer les mesures techniques et organisationnelles appropriées pour faire en sorte, en particulier, que les facteurs qui entraînent des erreurs dans les données à caractère personnel soient corrigés et que le *risque d’erreur soit réduit au minimum*, sécuriser les données à caractère personnel d’une manière qui *tienne compte des risques* susceptibles de peser sur les intérêts et les droits de la personne concernée, et prévenir, entre autres, les *effets discriminatoires* [...]

Néanmoins, les risques provoqués par les impacts dus à l'opacité, aux biais, aux erreurs des décisions algorithmiques n'ont pas été suffisamment pris en compte dans la législation spécifique à l'IA. Ils ont été en revanche largement commentés dans de très nombreuses déclarations et chartes pour une IA éthique au service de l'humanité (sic). Citons par exemple: 

- [Enjeux Éthiques de l’Algorithme et de l’Intelligence artificielle](https://www.cnil.fr/fr/comment-permettre-lhomme-de-garder-la-main-rapport-sur-les-enjeux-ethiques-des-algorithmes-et-de) (CNIL 2017) également très présents dans le 
- [rapport Villani](https://www.aiforhumanity.fr/pdfs/9782111457089_Rapport_Villani_accessible.pdf) (2018, partie 5), la
- [Déclaration de Montréal pour un développement responsable de l'IA](https://docs.wixstatic.com/ugd/ebc3a3_4272febbb17e42edb1d774e1e7339699.pdf) (2018) qui cite par ailleurs pas moins de 28 rapports nationaux ou professionnels et 
- [Ethics Guidelines for Trustworthy AI
Independant high-level expert group on Artificial Intelligence set up by the European Commission (2019)](https://ec.europa.eu/futurium/en/ai-alliance-consultation).

A la suite de ce dernier guide rédigé par un groupe d'experts, la Commission Européenne a édité un livre blanc :

- [Intelligence Artificielle: une approche basée sur l'excellence et la confiance](https://ec.europa.eu/info/sites/info/files/commission-white-paper-artificial-intelligence-feb2020_fr.pdf) (2020)

qui annonce la publication d'un nouveau réglement pour une *IA digne de confiance*.

En effet, des intentions et déclarations éthiques de non discrimination, transparence, précision de l'IA, ne suffisent pas à assurer les comportements vertueux (cf. l'affaire *Cambridge Analytica*) des entreprises, des lois applicables sont nécessaires pour les imposer. C'est incontournable pour gagner la confiance des usagers, contribuables, patients, consommateurs, citoyens, justiciables... L'*acceptabilité* des systèmes d'Intelligence Artificielle est en jeu. L'équation est assez simple, en l'absence de confiance, pas d'utilisateurs donc pas de données et finalement pas d'IA et pas de profits.

### 1.2 Apprentissage statistique: l'IA du quotidien 
La classe des algorithmes d'IA dits d'[apprentissage statistique](https://github.com/wikistat/Apprentissage)  (*statistical learning*) ou supervisés car entraînés sur des données, fournissent des aides automatiques à la décision ; ils envahissent nos quotidiens ([Besse et al. 2018b](http://statistique-et-societe.fr/article/view/719)). Tous les domaines sont touchés aux USA: police, justice, santé, banque, assurance, services sociaux, éducation, emploi, logement... En France comme en Europe, les contraintes juridiques, techniques et usages culturels, limitent ces applications. Certains domaines sont concernés de longue date, principalement le tertiaire: marketing, banque, assurance, d'autres le sont de plus en plus: industrie (détection de défaillance et maintenance prédictive), ressources humaines (pré-recrutement prédictif), santé et imagerie médicale ([Besse et al. 2019](https://hal.archives-ouvertes.fr/hal-02424285))... 

Des compléments d'informations sur les outils et algorithmes d'apprentissage statistique sont à rechercher dans les autres tutoriels du dépôt [`github/wikistat`](https://github.com/wikistat). 




### 1.3 Objectif
Le principal objectif du présent dépôt est de mettre à disposition des ressources pédagogiques sous forme de [tutoriels](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb) exécutant des outils, indicateurs et fonctionnalités, nécessaires à l'*évaluation de la confirmité des algorithmes aux réglementations* à venir. Elles sont préfigurées dans le [guide des experts de la CE](https://ec.europa.eu/futurium/en/ai-alliance-consultation) dont certains points sont rappelés en annexe. Les tutoriels sont développés sous la forme de calepins ou *jupyter notebooks* sur des cas d'usage bien identifiés afin de pouvoir exécuter concrètement des exemples d'évaluation *ex ante* de conformité. 

Le choix a été fait de développer les calepins avec les langages [R](https://github.com/wikistat/Intro-R) ou [Python](https://github.com/wikistat/Intro-Python); R plus simple et intuitif propose de nombreuses librairies facilitant les aides à l'interprétation, notamment graphiques et statistiques. En revanche Pyhton s'avère souvent plus efficace et reste un outil de référence dans la communauté numérique du *fair learning*. Il permet aussi des développements plus directement  opérationnels.

## 2 Risques des impacts sociétaux de l'apprentissage statistique

Trois aspects majeurs sont à considérer et détaillés par [Besse et al. (2018b)](https://hal.archives-ouvertes.fr/hal-01886699) pour prendre en compte voire évaluer les risques des impacts sociétaux des algorithmes d'apprentissage statistique.

### 2.2 Qualité, robustesse, résilience des décisions algorithmiques
*(Cf. point 2 de la liste d'évaluation en annexe)*

Les algorithmes d'apprentissage ne sont pas prouvables, certifiables de façon déterministe comme des algorithmes procéduraux. Néanmoins, l'évaluation de la qualité d'une décision algorithmique est une question essentielle lorsqu'il s'agit, par exemple, de discuter de l'opportunité d'une opération chirurgicale ou encore de la libération conditionnelle d'un détenu. La loi est encore muette sur ce sujet et n'oblige en rien à la communication des estimations des qualités des prévisions conduisant aux décisions, comme c'est le cas pour un sondage d'opinion. 

Les différentes étapes de l'apprentissage supervisé sont [détaillées et illustrées](https://github.com/wikistat/Apprentissage) par ailleurs sur de nombreux cas d'usage. Les méthodes de prévisions sont entraînées sur des données dont la qualité et la représentativité sont déterminantes. Les phases d'extraction, vérification, nettoyage, préparation des données sont critiques et doivent être conduites avec un soin particulier: *garbage in, garbage out*. Le volume des données peut être un facteur utile de qualité mais secondaire, seulement si celles-ci sont bien représentatives de l’objectif et pas biaisées. Dans le cas contraire des téraoctets  de données (*big data*) n’améliorent en rien la qualité.

Les stratégies d'apprentissage statistique intervenant ensuite sont rôdées et bien connues. L'objectif est d'optimiser le choix d'un algorithme afin, obligation de moyens, d'aboutir à la prévision minimisant un risque et ainsi à la meilleure décision. L'[estimation de l'erreur](http://wikistat.fr/pdf/st-m-app-risque.pdf) est donc intégrée à la démarche (cf. [tutoriel](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb)), il suffit de la documenter explicitement par souci de transparence.

L'évaluation de la conformité d'un algorihtme doit donc nécessairement documenter  l'estimation statistique de la [qualité de prévision](http://wikistat.fr/pdf/st-m-app-risque.pdf) (*accuracy*) ou capacité de généralisation ou encore robustesse. Celle-ci doit nécessairement être estimée sur un *échantillon test indépendant* de l'échantillon d'apprentissage et représentatif des modes d'acquisition auxquels l'algorithme va être confronté. L'exploitation d'un SIA doit être robuste aux anomalies ou situations atypiques (*outliers*) auxquelles il est susceptible d'être confronté et qui doivent donc être [détectées](http://wikistat.fr/pdf/st-m-app-anomalies.pdf)  tout le temps de sa durée de vie. Le process qualité associé doit donc inclure une boucle de rétroaction en cas d'erreur de décision afin d'en identifier la cause, généralement une insuffisance ou faille de la base d'apprentissage. Ce n'est pas une mise à jour logiciel qui s'impose alors, mais des ré-apprentissages périodiques sur la base corrigée. Enfin le SIA doit pouvoir faire preuve de résilience en adoptant par exemple un mode de fonctionnement dégradé mais assurant la sécurité des usagers en cas de panne d'un ou de capteurs.


### 2.2 Opacité et Explicabilité
*(Cf. point 4 de la liste d'avalutation en annexe)*

Une des principaux problèmes soulevés par l’IA réside dans l’opacité des algorithmes récents d’apprentissage statistique dont la complexité les rend impropres à une interprétation élémentaire comme c’est le cas d’un algorithme basé sur un modèle statistique linéaire ou un arbre de décision binaire. Attention, ce ne sont pas tant les algorithmes qui sont complexes mais la réalité sous-jacente qu'ils cherchent à modéliser. L'observation du réel est en effet soumise à de très nombreuses sources de complexité: interactions, non linéarités, variables inobservables, boucles de contre réaction...

La conséquence directe de cette complexité est le déploiement d'algorithmees opaques lorsqu'ils sont efficaces. L'explicabilté de leur fonctionnement et plus précisément des décisions auxquelles ils conduisent est devenu un enjeu majeur et un thème de recherche très actif. Une revue non exhaustive (Barredo Arrieta et al. 2020) cite déjà 426 références tandis que le [site *IBM research*](https://aix360.mybluemix.net/) propose quelques démonstrations des principales approches.

Un très bref aperçu schématique de ces travaux amène à poser trois questions: *Quel domaine d'utilisation? Quel niveau d’explication ? Pour qui (concepteur, utilisateur, usager)?* Qui conduisent à des possibilités ou systèmes d'explication différents.

1. Fonctionnement général de l’algorithme, domaines de défaillances
    - Modèles interprétables (linéaires, arbres) oposés aux algorithmes non linéaires (réseau de neurones, ensemble d'arbres, SVM...),
    - Approximation du modèle opaque par un modèle interprétable: linéaire, arbre, règles déterministes ou IA symbolique (système expert),...
    - Limiter l"explication" à la quantification de l'importance des variables obtenue en stressant l’algorithme par permutations aléatoires (*e;g. random forest, xtrem gradient boosting*) ou par projection entropique (Bachoc et al. 2020).

2. Décision spécifique découlant d'une prévision
    - Concepteur: Expliquer une erreur, y remédier, ré-apprentissage
    - Personne impactée: client, patient, justiciable... 
        - Cas d'un modèle interprétable : modèle linéaire, arbre de décision
        - Approximation locale d'un algorithme non-linéaire: LIME, arbre , contre-exemple,,...
        - *a minima*, notamment en santé, expliquer le risque d’erreur de la décision dans le cadre d'une procédure de recueuil d'un consentement libre et éclairé.


### 2.3 Risques de biais discriminatoires
*(Cf. point 5 de la liste d'évaluation en annexe)*

La loi française comme le règlement européen interdit toute forme de discrimination envers une personne ou un groupe identifié par une variable dite *sensible* (genre, origine ethnique, âge...). Par principe, un algorithme d'apprentissage reproduit les biais systémiques ou sociétaux des données donc les discriminations déjà présentes et il peut en plus les renforcer. Mais, arriver à caractériser qu'une décision algorithmique est biaisée donc discriminatoire reste compliqué. Il est apparemment facile d’opérer individuellement le *testing* (Riach et Rich 2002) d'une décision en modifiant la modalité de la variable sensible (femme en homme, noir en blanc, vieux en jeune...) d’une personne pour provoquer une éventuelle bascule de la décision, preuve d'une discrimination individuelle. Mais le *testing*, bien que périodiquement utilisé dans des enquêtes en France par la [DARES](https://dares.travail-emploi.gouv.fr/dares-etudes-et-statistiques/colloques-et-appels-a-projets/appels-a-projets-et-marches-d-etudes/appels-a-projets-de-recherche-et-marches-d-etude/ouverts/article/realisation-d-une-etude-quantitative-par-la-methode-du-testing-des) pour mesurer la discrimination à l'embauche, n'est pas  adapté à l'évaluation fiable d'une discrimination indirecte au détriment d'un groupe et complètement inefficace face à une décision algorithmique (cf. [tutoriel](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb)). 

Comme le souhaite le rapport Villani (2018), il est important de pouvoir définir une mesure quantitative de *discrimination envers un groupe*: *discrimination impact assessment* ou *DIA*. Il existe de très nombreux types de discrimination et indicateurs statistiques dans la littérature (Zliobaité 2017, [*IBM research*](https://aif360.mybluemix.net/)) pour les mesurer mais, comme le montre Friedler et al. (2019), il n'est pas utile de les multiplier car beaucoup sont redondants ou très corrélés entre eux. En priorité, nous pouvons considérer trois niveaux de biais mesurés par des indicateurs de plus en plus consensuels dans la communauté scientifique:

1. discrimination de groupe et effet disproportionné ou biais systémique: *disparate impact* (*DI*) ou *demographic equality*,
2. comparaison des précisions ou taux d'erreur conditionnellement à la variable sensible: *overall error equality*,
3. comparaison des taux de faux positifs et vrais négatifs conditionnellement à la variable sensible: *equalized odds*

Aux USA, la notion d'*adverse* ou *disparate impact* (effet disproporttionné) est utilisée depuis 1971 (Barocas et Selbst, 2017) pour mesurer des discriminations indirectes dans l'accès à l'emploi, le logement, le crédit. Il s'agit d'estimer le rapport de deux probabilités: probabilité d'une décision favorable pour une personne du groupe sensible au sens de la loi sur la même probabilité pour une personne de l'autre groupe. Des éléments de cette approche statistique sont présents dans un guide publié par le [Défenseur des Droits et la CNIL (2012)](https://www.defenseurdesdroits.fr/sites/default/files/atoms/files/836190240_access.pdf). Il décrit une approche méthodologique à l’intention des acteurs de l’emploi pour mesurer et progresser dans l’égalité des chances.

Tous ces niveaux de biais sont caractérisés par des indicateurs dont l'estimation est proposée par des intervalles de confiance (Besse et al. 2018) afin d'en contrôler la précision. Ils sont illustrés dans le [tutoriel](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb).

Après avoir identifié des biais dans les données d'apprentissage et évalué le comportement d'une algorihtme pour les reproduire, voire les renforcer, il s'agit ensuite de modérer ou corriger ces biais. Sur ce point aussi la littérature est très prolixe: cf. par exemple Friedler et al. (2019) ou le [site aif360.mybluemix.net](https://aif360.mybluemix.net/). Trois stratégies sont généralement proposées: 

- pre-processing en corrigeant les biais des données (*e.g.* del Barrio et al. 2019) d'apprentissage, 
- en intégrant une pénalisation de la fonction objectif dans le processus, 
- post-processing en corrigeant la décision après la prévision (cf. [tutoriel](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb)).  

La question initiale essentielle dépend de la volonté politique d'introduire ou non une forme de discriminaiton positive afin progresser vers une société plus "équitable":

*(52) Si les biais injustes peuvent être évités, les systèmes d’IA pourraient même améliorer le caractère équitable de la sociéte.*


## 3 Principaux résultats des tutoriels de détection des biais
### 3.1 Les données
Le problème s’énonce simplement : un algorithme entraîné à prendre des décisions à partir de données sociales biaisées reproduit fidèlement ces biais et peut même les amplifier et donc induire de fortes discriminations en lien avec le sexe, l'âge, l'origine des personnes… Ceci est illustré en considérant des [données publiques](https://archive.ics.uci.edu/ml/datasets/Adult) qui imitent le contexte de calcul d’un score de crédit. Elles sont extraites d’un recensement de 1994 aux USA et décrivent l’âge, le type d’emploi, le niveau d’éducation, le statut marital, l’origine ethnique, le nombre d’heures travaillées par semaine, la présence ou non d’un enfant, les revenus ou pertes financières, le genre et le niveau de revenu bas ou élevé. Elles servent de référence ou bac à sable pour tous les développements d’algorithmes  d’apprentissage automatique équitable. Il s'agit de prévoir si le revenu annuel d'une personne est supérieur ou inférieur à 50k$ et donc  de prévoir, d'une certaine façon, sa solvabilité connaissant ses origines, âge, sexe, diplôme, type d’emploi…  L’étude complète et les codes sont disponibles mais l’illustration est limitée à un résumé succinct de l’analyse de la discrimination selon le sexe. 

### 3.2 Résultats
Les données incluent un biais de société important estimé sur un échantillon de 45 000 personnes : seulement 11,6 % des femmes ont un revenu élevé contre 31,5% des hommes. Le rapport: *DI=0,38* est donc très disproportionné. Différents modèles ou algorithmes sont entraînés sur une partie (apprentissage) des données puis exécutés sur la partie test restante. Les résultats sont regroupés dans la figure 1.


<img src="https://www.math.univ-toulouse.fr/~besse/Images/resDIdiscrim.png" height="350"  alt="graphe">

*Figure 1. Précision de la prévision (accuracy) et effet disproportionné estimé par un intervalle de confiance sur un échantillon test (taille 9000) pour différents modèles ou algorithmes d’apprentissage.*

Le biais initial des données *(DI=0,38)* est comparé avec celui de la prévision de niveau de revenu par un modèle classique linéaire de régression logistique `linLogit` : *DI=0,25*. Significativement moins élevé (intervalle de confiance disjoint), il montre que ce modèle renforce le biais et donc discrimine nettement les femmes dans sa prévision. La procédure naïve (`linLogit-w-s`) qui consiste à éliminer la variable dite sensible (genre) du modèle ne supprime en rien *(DI=0,27)* le biais discriminatoire car le genre est de toute façon présent à travers les valeurs prises par les autres variables. Une autre conséquence de cette dépendance est que le *testing* (changement de genre toutes choses égales par ailleurs) ne détecte plus *(DI=0.90)* aucune discrimination!

Un algorithme non linéaire plus sophistiqué est très fidèle au biais des données avec un indicateur (DI=0,36) pas significativement différent du biais de société et fournit une meilleure précision (0,86 au lieu de 0,84 pour la régression logistique). Cet algorithme ne discrimine pas mais c’est au prix de l’interprétabilité du modèle. Opaque comme un réseau de neurones, il ne permet pas d’expliquer une décision à partir de ses paramètres comme cela est facile avec le modèle de régression. Enfin, la dernière ligne propose une façon simple, parmi une littérature très volumineuse (FRiedler et al. 2019, site [*IBM research*]()), de corriger le biais pour plus de « justice sociale ». Deux algorithmes sont entraînés, un par genre et le seuil de décision (revenu élevé ou pas, accord ou non de crédit…) est abaissé pour les femmes : 0,3 au lieu de celui par défaut de 0,5 pour les hommes. C’est une façon, parmi beaucoup d’autres, d’introduire une part de discrimination positive.

Les autres types de biais sont également à considérer. Par principe, la précision de la prévision pour un groupe dépend de sa représentativité. Si ce dernier est sous représenté, l'erreur est plus importante; c'est typiquement le cas en reconnaissance faciale mais pas dans l'exemple traité. Alors qu'elles sont deux fois moins nombreuses dans l'échantillon, le taux d'erreur de prévision est de l'ordre de *7,9%* pour les femmes et de *17%* pour les hommes. Il faut donc considérer le troisième type de biais pour se rendre compte que c’est finalement à leur désavantage. Le taux de faux positifs est plus important pour les hommes *(0,08)*, ce qui les favorise, que pour les femmes *(0,02)*, alors que le taux de faux négatifs est plus important pour les femmes *(0,41)* que pour les hommes *(0,38)*.

### 3.3 Discussion
Nous pouvons tirer quelques enseignements de cet exemple rudimentaire, enseignements qui s’appliquent aux algorithmes de pré-recrutement basées sur l’apprentissage automatique de CV ou vidéos. Sans précaution, si un biais est présent dans les données, il est reproduit voire renforcé avec un algorithme linéaire. Un algorithme plus sophistiqué, non linéaire ne fait que reproduire le biais mais ne permet plus de justification économique des choix si l'effet disproportionné est important *(DI<0.8)*. C’est vraisemblablement ce qui a conduit [*Amazon* à stopper précipitamment](https://www.reuters.com/article/us-amazon-com-jobs-automation-insight/amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUSKCN1MK08G) sa procédure automatique de recrutement sur des postes techniques qui ne sélectionnait plus de femmes. La procédure de *testing*, déjà peut convaincante pour évaluer une discrimination indirecte *ex post*, est complètement inadaptée face à une procédure algorithmique. 

Actuellement en Europe, un ou une *data scientist* est libre de produire ce qu’il peut ou veut, en fonction de ses compétences et de sa déontologie personnelle: de l’algorithme élémentaire interprétable mais discriminatoire à une procédure incluant de la discrimination positive. Aucune procédure de contrôle *ex ante* ou *post*, ne vient le remettre en cause. En revanche, aux USA, l’[usage officiel de prise en compte de l’effet disproportionné](https://www.govinfo.gov/content/pkg/CFR-2017-title29-vol4/xml/CFR-2017-title29-vol4-part1607.xml) incite très fortement les entreprises développant des logiciels ou plateformes de pré-recrutement à le prendre en compte (Raghavan er al. 2019). Elles proposent des solutions en ce sens, non pour des raisons éthiques, mais d’argumentation commerciale : économiser des procédures coûteuses de justification en cas d’effet disproportionné trop marqué.

## Conclusion
Pour apporter des élémenets de conclusion de ce rapide tour d'horizon, rappelons qu'après avoir montré l'*utilité* effective d'un sytème d'IA au regard des risques encourus et de ses coûts (financiers, environnementaux), *tout est affaire de compromis* entre les principaux risques des impacts sociétaux car ils sont tous interconnectés:

- Confidentialité, protection ds données vs. connaissance de la variable sensible
- Qualité, robustesse de la décision algorithmique
- Explicabilité de la décision algorithmique
- Types de bais (systémique, des erreurs, de leur asymétrie)  donc risques de discrimination.

La prise en compte "optimale" de l'un d'entre eux influence nécessairement les autres.

Le contrôle des risques des impacts sociétaux d'un SIA est toujours  un problème largement ouvert sur différents chantiers:

- auditabilité d'un SIA et *liste d'évaluation* (Commission Européenne, [Haute Autorité de Santé](https://www.has-sante.fr/upload/docs/application/pdf/2016-01/guide_fabricant_2016_01_11_cnedimts_vd.pdf) avec pour conséquence un renversement de la charge de preuve,
- Nécessité de définir des normes pour les indicateurs à utiliser (AFNOR, ANSI, IEEE) afin d'aborder les
- enjeux très contraignants de certification en santé (FDA, HAS) et dans l'industrie (*e.g.* véhicules autonomes, avion à 1 pilote).

## Références
- Bachoc F., Gamboa F., Loubes J.-M., and Risser L. (2020). Entropic Variable Projection for Explainability and Intepretability, [arXiv preprint](https://arxiv.org/abs/1810.07924).
- Barocas S. , Selbst A. (2016). Big Data's Disparate Impact, 104 *California Law Review*, 104 671. http://dx.doi.org/10.2139/ssrn.2477899
- Besse P. ,del Barrio E., Gordaliza P., Loubes J.-M. (2018-a). Confidence Intervals for testing Disparate Impact in Fair Learning, [arXiv preprint](https://arxiv.org/abs/1807.06362).
- Besse P., Besse Patin A., Castets Renard C. (2019). Implications juridiques et éthiques des algorithmes d'intelligence artificielle dans le domaine de la santé, soumis, [hal-02424285](https://hal.archives-ouvertes.fr/hal-02424285).
- Besse P., Castets-Renard C., Garivier A., Loubes J.-M. (2018-b). L'IA du Quotidien peut elle être Éthique?  Loyauté des Algorithmes d'Apprentissage Automatique, *Statistique et Société*, [Vol. 6 N°3](http://statistique-et-societe.fr/article/view/719).
- del Barrio E., Gamboa F., Gordaliza P., Loubes J.-M. (2018). Obtaining fairness using optimal transport theory, ICML 2019, [arXiv preprint](https://arxiv.org/pdf/1806.03195).
- Friedler S., Scheidegger C., Venkatasubramanian S., Choudhary S., Hamilton E., Roth D. (). Comparative study of fairness-enhancing interventions in machine learning. *Proceedings of the Conference on Fairness, Accountability, and Transparency*, p. 329‐38.  http://dl.acm.org/citation.cfm?doid=3287560.3287589
- Raghavan M., Barocas S., Kleinberg J., Levy K. (2019) Mitigating bias in Algorithmic
Hiring : Evaluating Claims and Practices, [arXiv:1906.09208](https://arxiv.org/abs/1906.09208).
- Riach P.A., Rich J. (2002). Field Experiments of Discrimination in the Market Place, The Economic Journal, Vol. 112 (483), pp F480-F518.
- Zliobaité I. (2017). Measuring discrimination in algorithmic decision making. Data Min Knowl Disc 31, 1060–1089. doi.org/10.1007/s10618-017-0506-1.

## Annexe: Extraits du Guide des Experts de la CE pour une IA Digne de Confiance

Relevons certains points mis en exergue dans le le guide: 

- (52) Si les biais injustes peuvent être évités, les systèmes d’IA pourraient même améliorer le caractère équitable de la sociéte.
- (69) Il est important que le système puisse indiquer le niveau de probabilité de ces erreurs.
- (80) Absence de biais injustes: La persistance de ces biais pourrait être source de discrimination et de préjudice (in)directs. Dans la mesure du possible, les biais détectables et discriminatoires devraient être supprimés lors de la phase de collecte.
- (106) (107) besoin de normalisation.

AInsi que des questions de la liste d'évaluation

*2. Robustesse technique et sécurité*

- *Précision*
   - Avez-vous évalué le niveau de précision et la définition de la précision nécessaires dans le contexte du système d’IA et du cas d’utilisation concerné?
    - Avez-vous réfléchi à la manière dont la précision est mesurée et assurée?
    - Avez-vous mis en place des mesures pour veiller à ce que les données utilisées soient exhaustives et à jour?
    - Avez-vous mis en place des mesures pour évaluer si des données supplémentaires sont nécessaires, par exemple pour améliorer la précision et éliminer les biais?

*4. Transparence*

- *Explicabilité*
    - Avez-vous évalué la mesure dans laquelle les décisions prises, et donc les résultats obtenus, par le
système d’IA peuvent être compris?
    - Avez-vous veillé à ce qu’une explication de la raison pour laquelle un système a procédé à un certain
choix entraînant un certain résultat puisse être rendue compréhensible pour l’ensemble des utilisateurs qui pourraient souhaiter obtenir une explication?

*5. Diversité, non-discrimination et équité*

- Avez-vous prévu une stratégie ou un ensemble de procédures pour éviter de créer ou de renforcer des biais
injustes dans le système d’IA, en ce qui concerne tant l’utilisation des données d’entrée que la conception de
l’algorithme ?
- Avez-vous réfléchi à la diversité et à la représentativité des utilisateurs dans les données ? 
- Avez-vous procédé à des essais portant sur des populations spécifiques ou des cas d’utilisation problématiques?
- Avez-vous recherché et utilisé les outils techniques disponibles pour améliorer votre compréhension des données,
du modèle et de la performance ?
- Avez-vous mis en place des processus pour tester et contrôler les biais éventuels au cours de la phase de mise
au point, de déploiement et d’utilisation du système ?
- Avez-vous prévu une analyse quantitative ou des indicateurs pour mesurer et tester la définition appliquée de
l’équité ?

