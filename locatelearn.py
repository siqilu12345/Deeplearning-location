import tensorflow as tf
import numpy as np
tf.logging.set_verbosity(tf.logging.INFO)
train=np.loadtxt(fname='/Users/siqilu/Desktop/datainput/traininput.txt')
trainx=train[:,:-4]
trainy=train[:,-4:]
test=np.loadtxt(fname='/Users/siqilu/Desktop/datainput/testinput.txt')
testx=test[:,:-4]
testy=test[:,-4:]
'''
validation_monitor = tf.contrib.learn.monitors.ValidationMonitor(
    x=testx,
    y=testy,
    every_n_steps=2000,
    early_stopping_metric="loss",
    early_stopping_metric_minimize=True,
    early_stopping_rounds=8000)
'''
feature_columns = [tf.contrib.layers.real_valued_column("",dimension=20)]

mymodel = tf.contrib.learn.DNNRegressor(feature_columns=feature_columns,
                                              hidden_units=[30, 20, 10],
                                        enable_centered_bias=True,
                                        model_dir='/Users/siqilu/Desktop/savemodel',
                                            config = tf.contrib.learn.RunConfig(
                                                num_cores=4),
                                           label_dimension=4)
mymodel.fit(x=trainx,y=trainy,batch_size=50,max_steps=70000)
b=mymodel.predict(x=testx[:10])
print(list(b))
b=mymodel.predict(x=testx)
c=list(b)
c=np.array(c)
c=testy-c
c0=(np.sum(c[:,0]**2)/1000)**0.5
c1=(np.sum(c[:,1]**2)/1000)**0.5
c2=(np.sum(c[:,2]**2)/1000)**0.5
c3=(np.sum(c[:,3]**2)/1000)**0.5
print(c0,c1,c2,c3)
