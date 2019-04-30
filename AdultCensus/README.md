<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/Logo_INSAvilletoulouse-RVB.png" style="float:left; max-width: 130px; display: inline" alt="INSA"/></a> 
<a href="http://www.univ-tlse3.fr/" ><img src="http://www.univ-tlse3.fr/medias/photo/ut3pres_logoq_1372757033342.jpg?ID_FICHE=49702" style="float:right; max-width: 250px; display: inline"  alt="insa"/></a>
<br>  </br>

# Apprentissage Statistique Loyal pour IA Ethique
## Ressources pédagogiques

## *Adult Census Data analysis*
Les données sont décrites dans les deux tutoriels proposés

## 1 [Calepin R](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb)

L'exécution permet d'aboutir à un premier relevé de conclusions

1. De façon assez triviale les données du sondage présentent des biais sociologiques importants vis-à-vis des groupes de genre et d'origine ethnique. Le biais, mesuré par l'effet disproportionné (*Disparate impact* ou *DI*), est nettement plus marqué conditionnellement au genre.
2. Une prévision du seuil de revenu par régression logistique, comme par tout autre algorithme d'apprentissage, renforce ce biais; le *DI* décroît. C'est même statistiquement significatif: intervalles de confiance  disjoints, pour le genre avec la régression logistique sans interaction et plus modéré pour l'origine. *La modélisation opère une discrimination conditionnellement au genre*. 
3. *Comme la précision, l'augmentation du biais dépend de l'algorithme opéré*. Sur ces points, les forêts aléatoires sont plus performantes que la régression logistique, sur-biaisent moins mais sont opaques à une interprétation. L'itération de la séparation aléatoire des échantillons apprentissage / test (validation croisée *Monte Carlo*) révèle une instabilité importante de l'estimation du *DI* même sur une relativement grosse base de données.
3. Les taux d'erreurs conditionnels aux variables sensibles sont assez différents; une estimations par intervalle de confiance serait bienvenue. *L'accroissement de l'erreur est dans ce cas au détriment de la classe majoritaire*.  
4. La suppression des variables sensibles de la prévision ne change rien aux points 2 et 3 précédents. C'est une *procédure naïve et inefficace pour corriger le *DI* donc un biais de groupe*.
5. En revanche, une pratique parfois jugée déloyale et qui consiste à adapter le seuil de décision de la prévision, le baisser pour le groupe à protéger, réduit significativement le biais pour le *rendre similaire à celui de la base d'entraînement*; il n'y a plus discrimination de groupe. La procédure qui consisterait à réduire plus le seuil pour corriger le biais de société revient à introduire une discrimination positive. Il s'agit d'un choix politique et non plus statistique. Dans ce cas, l'erreur de prévision se dégrade.
5. *Attention* le choix de la valeur seuil pour débiaiser doit être réalisé avec soin (validation croisée) pour éviter une forme de surapprentissage: seuil trop adapté à l'échantillon test.
6. D'autre procédures de débiaisage ou d'apprentissage loyal sont à prendre en compte. C'est l'objet d'un autre tutoriel en python.
7. Après l'effet disproportionné (*DI*) et les taux d'erreur conditionnels, il est important de considérer les éventuelles *asymétries des matrices de confusion conditionnelles* aux variables sensibles. Le rapport des taux de vrais positifs conditionnels ainsi que celui des taux de vrais négatifs conditionnels témoignent de différences de traitement marqués relativement aux groupes. Les taux d'erreurs sont effectivement importants pour les hommes mais c'est finalement à leur avantage car le *taux de faux positifs est significativement plus important les concernant au contraire des taux de faux négatifs plus importants pour les femmes*. En cas d'erreur celle-ci est donc en moyenne au profit des hommes. Comme précédemment ce phénomène est peu marqué conditionnellement à l'origine ethnique.
8. Le dernier point abordé concerne la détection d'une discrimination individuelle par *testing*. Finalement peu de femmes ou de non-caucasiens pourraient se déclarer discriminés par la prévision et être donc en mesure, individuellement, de porter plainte. Cette mesure individuelle de la discrimination, est finalement assez annecdotique au regard de la mesure de discrimination de groupe; autrement dit, sur cet exemple, *une mesure individuelle de la discrimination par testing minimise son importance*. 
9. Corriger la prévision pour attribuer la prévision la plus favorable quel que soit la modalité sensible, permet à une entreprise ou administration d'échapper à une investigation par *testing* mais ne fait en rien décroîte le biais (*DI*) donc la discrimination de groupe. Ce serait une *pratique tout à fait déloyale*.
10. En France, comme en Europe, il y a une part d'hypocrisie à interdire l'enregistrement d'une variable sensible. Certes, cela protège la confidentialité des personnes mais empêche aussi de mettre simplement en évidence biais et discriminations des traitements vis-à-vis d'un groupe ou des individus.

## 2 [Calepin Python](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-Python-bias.ipynb)

L'exécution permet d'aboutir aux éléments suivants:

### 2.1 Discussion
Les résultats des exécutions précédentes sont conformes à ceux de l'artilce mais évidemment tout n'a pas été vérifié; notamment pour les autres jeux de données et à cause du plantage de certains algos. 

En résumé: 
- Précision:
   - Conformément à l'article, la régression logistique fait mieux que celle exécutée en R qui est plus frustre: moins de variables prises en compte et pas l'interaction `sex-race`.
   - Random forest fournit des résultats très voisins de ceux de la régression logistique mais en retrait par rapport à ceux de R... il faudrait itérer les séparations apprentissage / test  pour confirmer et contrôler la cohérence du choix de `max_features` *vs.* `mtry`.
- *DI*
   - le *DI* de la régression logistique est conforme à l'article et donc aux ex&écutions précédentes, plus élevé que celui de R.
   - celui de *Random Forest* est en revanche plus faible que celui de R !
- Il faudrait:
   - compléter les résultats en itérant ceux-ci-dessus
   - comprendre mieux pourquoi la régression logistique fait mieux en python au contraire de random forest. 
   - ajouter d'autres modèles: arbre binaire de décision, SVM, classifieur bayésien...

Les différences observées entre R et Python proviennent donc bien des pré-traitements très différents et des listes des variables finalement retenues.
   
### 2.2 Suggestion de compléments
#### Compléter 
les comparaisons en repartant des données initiales en python et contrôlant le prétraitement et les variables incluses dans les modèles.
- estimer le DI
- régression logistique, arbre, random forest, autre ?
- estimer les différents DI

#### Correction élémentaire du biais
Le problème principal réside dans le choix du seuil plus favorable pour les femmes: 
- partager l'échantillon en trois parties train, validation et test ou voir ce qui est proposé dans calders et Verwer (2010)
- estimer le modèle (train)
- chercher un bon seuil (validation) pour un DI de 0.38 des données initiales
- estimer le DI sur le test pour vérifier s'il est correct ou pas.

Cette procédure est bien moins élégante que celles des algoritmes cherchant une indépendance entre la décision et la variable sensible mais tellement plus simple et rapide à mettre en place...

### 2.3 Ajouter d'autres algorithmes ?
Qu'en est il d'autres approches de débiaisage: 
- par transport optimal
    - [Article](https://arxiv.org/pdf/1806.03195.pdf)
    - [Code en R](https://github.com/JMLToulouse/FairLearning)
- par GAN ou DANN?
    - [Article](http://jmlr.org/papers/volume17/15-239/15-239.pdf)
    - [Code Keras](https://github.com/michetonu/gradient_reversal_keras_tf)
- autre?

Une fois ces tâches de comparaison réalisées et les bons outils sélectionnés *consensuellement*... il serait pertinent de produire une librairie efficace car parallélisée et industrialisable de correction du biais pour aborder des problèmes de la vraie vie et pas seulement des jeux de données publics mais élémentaires même si volumineux. Comme le montre ces différentes expérimentations, le contexte, les données disponibles, leur qualité, les questions de confidentialité... sont ou seront prépondérantes sur les méthodes ou algoritmes à mettre en oeuvre dans le cadre d'un audit.
