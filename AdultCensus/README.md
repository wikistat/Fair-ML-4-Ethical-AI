<a href="http://www.insa-toulouse.fr/" ><img src="http://www.math.univ-toulouse.fr/~besse/Wikistat/Images/Logo_INSAvilletoulouse-RVB.png" style="float:left; max-width: 130px; display: inline" alt="INSA"/></a> 
<a href="http://www.univ-tlse3.fr/" ><img src="http://www.univ-tlse3.fr/medias/photo/ut3pres_logoq_1372757033342.jpg?ID_FICHE=49702" style="float:right; max-width: 250px; display: inline"  alt="insa"/></a>
<br>  </br>

# Apprentissage Statistique Loyal pour IA Ethique
## Ressources pédagogiques

## *Adult Census Data analysis*
Les données sont décrites dans les deux tutoriels proposés

## 1 [Calepin R](https://github.com/wikistat/Fair-ML-4-Ethical-AI/blob/master/AdultCensus/AdultCensus-R-biasDetection.ipynb)



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
