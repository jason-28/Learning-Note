from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report, precision_score, recall_score, f1_score, roc_auc_score, roc_curve, scorer, auc
from yellowbrick.classifier import DiscriminationThreshold

# Splitting train and test data
X_train, X_test, y_train, y_test = train_test_split(df_dummies.drop(columns=['y']), df_dummies['y'], test_size=0.25, random_state=42)

def select_model_prediction(algorithm, train_x, test_x, train_y, test_y, cols, cf, threshold_plot=True):
    
    # model 
    algorithm.fit(train_x, train_y)
    predictions = algorithm.predict(test_x)
    
    probabilities = algorithm.predict_proba(test_x)
    
    # Choose logit or tree models
    if cf == 'coefficient':
        coefficients = pd.DataFrame(algorithm.coef_.ravel()) # ravel change to flat array
    elif cf == 'features':
        coefficients = pd.DataFrame(algorithm.feature_importances_)
    
    # Build feature importance dataframe
    columns_df = pd.DataFrame(cols)
    coef_sumry = (pd.merge(coefficients, columns_df, left_index=True, right_index=True, how='left'))
    coef_sumry.columns =  ['coefficients', 'features']
    coef_sumry = coef_sumry.sort_values(by='coefficients')
    
    print(type(algorithm).__name__)
    print('-' * 100)
    print('Accuracy: {:5.2f}'.format(accuracy_score(y_test, probabilities[:, 1] > 0.5)))
    print('F1: {:11.2f}'.format(f1_score(y_test, probabilities[:, 1] > 0.5)))
    print('Precision: {:4.2f}'.format(precision_score(y_test, probabilities[:, 1] > 0.5)))
    print('Recall: {:7.2f}'.format(recall_score(y_test, probabilities[:, 1] > 0.5)))
    
    conf_matrix = confusion_matrix(test_y, probabilities[:, 1] > 0.5)
    model_roc_auc = roc_auc_score(test_y, probabilities[:, 1] > 0.5)
    fpr, tpr, thresholds = roc_curve(test_y, probabilities[:, 1])
    
    # plot confusion matrix
    trace1 = go.Heatmap(z = conf_matrix,
                       x = ['Not Subscribe', 'Subscribe'],
                       y = ['Not Subscribe', 'Subscribe'],
                       showscale=False, colorscale='Picnic',
                       name='matrix')

    # plot roc curve
    trace2 = go.Scatter(x = fpr, y= tpr,
                        name = 'Roc:' + str(model_roc_auc),
                        line = dict(color=('rgb(22, 96, 167)'), width=2))
    trace3 = go.Scatter(x = [0, 1], y = [0, 1],
                        line=dict(color=('rgb(205, 12, 24)'), width=2,
                        dash = 'dot'))
    
    # plot coeffs
    trace4 = go.Bar(y=coef_sumry['features'], x=coef_sumry['coefficients'],
                    name='coefficients',
                    orientation='h',
                    marker = dict(color=coef_sumry['coefficients'],
                                  colorscale='Picnic',
                                  line=dict(width=.6, color='black')))
    
    # subplots
    fig = tls.make_subplots(rows=2, cols=2, specs=[[{}, {}], [{'colspan': 2}, None]],
                            subplot_titles=('Confusion_Matrix',
                                            'Receiver Operating Characteristic',
                                            'Feature Importance'))
    
    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace3, 1, 2)
    fig.append_trace(trace4, 2, 1)
    
    fig['layout'].update(showlegend=False, title='Model performance',
                         autosize=False, height=900, width=1000,
                         plot_bgcolor='rgba(240,240,240, 0.95)',
                         paper_bgcolor = 'rgba(240,240,240, 0.95)',
                         margin=dict(b=195))
    
    fig['layout']['xaxis2'].update(dict(title='false positive rate'))
    fig['layout']['yaxis2'].update(dict(title='true positive rate'))
    fig['layout']['xaxis3'].update(dict(showgrid=True, tickfont=dict(size=10)),
                                   tickangle=0)
    py.iplot(fig)
    
    if threshold_plot == True:
        visualizer = DiscriminationThreshold(algorithm)
        visualizer.fit(train_x, train_y)
        visualizer.poof()

# source:https://medium.com/@jacky308082/%E5%A6%82%E4%BD%95%E5%BE%9E%E9%A0%AD%E5%88%B0%E5%B0%BE%E5%AE%8C%E6%88%90%E4%B8%80%E5%80%8B%E8%B3%87%E6%96%99%E7%A7%91%E5%AD%B8-data-science-%E5%B0%88%E6%A1%88-e3d003853885
