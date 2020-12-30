"""
    fit_complex

    Script to compare fit & complexity of different ML methods

    Taken from the book Ensemble Methods for Machine Learning, Chapter 1

    Author: Kay-Uwe Kirstein <kay-uwe@kirsteinhome.ch>

"""

import numpy as np
import pandas as pd
import seaborn as sns

from sklearn.datasets import load_boston
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeRegressor
from sklearn.svm import SVR
from sklearn.model_selection import ShuffleSplit, validation_curve

# load & scale dataset
X, y = load_boston(return_X_y=True)
X = StandardScaler().fit_transform(X)
y = StandardScaler().fit_transform(y.reshape(-1, 1))

# regression by decision trees
subsets = ShuffleSplit(n_splits=5, test_size=0.33, random_state=23)

dtree_model = DecisionTreeRegressor()
dtree_max_depth = range(1, 11)

trn_scores, tst_scores = validation_curve(
    dtree_model,
    X, y,
    param_name='max_depth',
    param_range=dtree_max_depth,
    cv=subsets,
    scoring='r2')

mean_trn_scores = np.mean(trn_scores, axis=1)
mean_tst_scores = np.mean(tst_scores, axis=1)
dtree_scores = pd.concat([
    pd.DataFrame({
        'max_depth': dtree_max_depth,
        'score': mean_trn_scores,
        'subset': 'train'
    }),
    pd.DataFrame({
        'max_depth': dtree_max_depth,
        'score': mean_tst_scores,
        'subset': 'test'
    })
])

# show dtree scores
# print(df)
sns.set_style('darkgrid')
dtree_plot = sns.relplot(
    data=dtree_scores,
    x='max_depth', y='score', hue='subset'
).set_titles('dtree scores')
dtree_plot.savefig('dtree_scores.png')

# regression by support vector machine
svr_model = SVR(degree=3)
svr_loss_factor = np.logspace(-2, 4, 7)

trn_scores, tst_scores = validation_curve(
    svr_model,
    X, y.ravel(),
    param_name='C',
    param_range=svr_loss_factor,
    cv=subsets,
    scoring='r2')

mean_trn_scores = np.mean(trn_scores, axis=1)
mean_tst_scores = np.mean(tst_scores, axis=1)

svr_scores = pd.concat([
    pd.DataFrame({
        'loss_factor': svr_loss_factor,
        'score': mean_trn_scores,
        'subset': 'train'
    }),
    pd.DataFrame({
        'loss_factor': svr_loss_factor,
        'score': mean_tst_scores,
        'subset': 'test'
    })
])

# show dtree scores
sns.set_style('darkgrid')
svr_plot = sns.relplot(
    data=svr_scores,
    x='loss_factor', y='score', hue='subset'
).set_titles('SVR scores')
dtree_plot.savefig('svr_scores.png')
