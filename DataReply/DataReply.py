import numpy as np
import keras
from keras.datasets import mnist
import matplotlib.pyplot as plt
import matplotlib as mpl
(X_train, y_train), (X_test, y_test) = mnist.load_data()

slice = 10

plt.figure(figsize=(16,8))

for i in range(slice):
    plt.subplot(1, slice, i+1)
    plt.imshow(X_test[i], interpolation='nearest', cmap=mpl.cm.Blues)
    plt.axis('off')


from keras import backend as K

img_rows, img_cols = 28, 28

if K.image_data_format() == 'channels_first':
    shape_ord = (1, img_rows, img_cols)
else:  # channel_last
    shape_ord = (img_rows, img_cols, 1)

shape_ord

# Saving the original datasets
X_test_orig = X_test.copy()
X_train_orig = X_train.copy()

# Reshape training and test set
X_train = X_train.reshape((X_train.shape[0],) + shape_ord)
X_test = X_test.reshape((X_test.shape[0],) + shape_ord)

X_train = X_train.astype('float32')
X_test = X_test.astype('float32')


# Change the shape (samples, 28, 28) to (samples, 28, 28, 1) 
# means "slicing" the image matrix
print X_train[0].shape
print X_train[0]


# Normalize training and test set respect with the maximum value stored in the training set
max_value = X_train.max()
X_train /= max_value
X_test /= max_value



X_test = X_test.copy()
# Converting the output to binary classification(Six=1, Not Six=0)
Y = y_test.copy()
Y_test = Y == 6
Y_test = Y_test.astype(int)

# Selecting the 5918 examples where the output is 6
X_six = X_train[y_train == 6].copy()
Y_six = y_train[y_train == 6].copy()

# Selecting the examples where the output is not 6
X_not_six = X_train[y_train != 6].copy()
Y_not_six = y_train[y_train != 6].copy()

# Selecting 6000 random examples from the data that 
# only contains the data where the output is not 6
np.random.seed(1338)  # for reproducibilty!!
random_rows = np.random.randint(0,X_not_six.shape[0],6000)
X_not_six = X_not_six[random_rows]
Y_not_six = Y_not_six[random_rows]


# Appending the data with output as 6 and data with output as <> 6
X_train = np.append(X_six,X_not_six)

# Reshaping the appended data to appropraite form
X_train = X_train.reshape((X_six.shape[0] + X_not_six.shape[0],) + shape_ord)

# Appending the labels and converting the labels to 
# binary classification(Six=1, Not Six=0)
Y_labels = np.append(Y_six,Y_not_six)
Y_train = Y_labels == 6 
Y_train = Y_train.astype(int)


print(X_train.shape, Y_train.shape, X_test.shape, Y_test.shape)

# Converting the classes to its binary categorical form
nb_classes = 2

from keras.utils import np_utils

Y_train = np_utils.to_categorical(Y_train, nb_classes)
Y_test = np_utils.to_categorical(Y_test, nb_classes)


print( Y_labels[5914:5925])
print( Y_train[5914:5925])


# Importing libraries
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation, Flatten
from keras.layers.convolutional import Conv2D
from keras.layers.pooling import MaxPooling2D
from keras.optimizers import SGD


## Initializing the values for the convolution neural network

nb_epoch = 10    # kept very low! Please increase if you have GPU
batch_size = 64  # number of samples per gradient update
nb_filters = 32  # number of convolutional filters to use
# nb_pool = 2      # size of pooling area for max pooling
nb_conv = 3      # convolution kernel size


## Sequential model:

model = Sequential()


# Input convolutional layer with 32 filter, each filter is a 3x3 kernel
model.add(Conv2D(nb_filters, (nb_conv, nb_conv), padding='valid', input_shape=shape_ord))


# Non linear activation function
model.add(Activation('relu'))

# Flattening of the 32 matrix
model.add(Flatten())

#Output dense layer of 2 nodes
model.add(Dense(nb_classes))
model.add(Activation('softmax'))


model.compile(loss='categorical_crossentropy',
              optimizer='sgd',
              metrics=['accuracy'])


model.summary()


from keras.callbacks import EarlyStopping

early_stop = EarlyStopping(monitor='val_loss', patience=1, verbose=1)    

hist = model.fit(X_train, 
                 Y_train, 
                 batch_size=batch_size, 
                 epochs=nb_epoch, 
                 verbose=2, 
                 validation_data=(X_test, Y_test), 
                 callbacks=[early_stop]) 


plt.figure()
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.plot(hist.history['loss'])
plt.plot(hist.history['val_loss'])
plt.legend(['Training', 'Validation'])

plt.figure()
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.plot(hist.history['acc'])
plt.plot(hist.history['val_acc'])
plt.legend(['Training', 'Validation'], loc='lower right')


print('Available Metrics in Model: {}'.format(model.metrics_names))


# Evaluating the model on the test data    
loss, accuracy = model.evaluate(X_test, Y_test, verbose=2)
print('Test Loss:', loss)
print('Test Accuracy:', accuracy)


import matplotlib.pyplot as plt
import matplotlib as mpl

slice = 15
predicted = model.predict(X_test[:slice])
print(predicted)

predicted = model.predict(X_test[:slice]).argmax(axis=1)
print(predicted)

plt.figure(figsize=(16,8))

for i in range(slice):
    plt.subplot(1, slice, i+1)
    plt.imshow(X_test_orig[i], interpolation='nearest', cmap=mpl.cm.Blues)
    plt.text(0, 0, predicted[i], color='black', 
             bbox=dict(facecolor='white', alpha=1))
    plt.axis('off')






## Sequential model:
model = Sequential()

# Input convolutional layer with 32 filter, each filter is a 3x3 kernel
model.add(Conv2D(nb_filters, (nb_conv, nb_conv),
                 padding='valid', input_shape=shape_ord))

# Non linear activation function
model.add(Activation('relu'))

# Flattening of the 32 matrix
model.add(Flatten())

# Hidden dense layer of 128 nodes
model.add(Dense(128))
model.add(Activation('relu'))

# Output dense layer of 2 nodes
model.add(Dense(nb_classes))
model.add(Activation('softmax'))

model.compile(loss='categorical_crossentropy',
              optimizer='sgd',
              metrics=['accuracy'])

model.fit(X_train, Y_train, batch_size=batch_size, 
          epochs=nb_epoch,verbose=2,
         # callbacks=[early_stop],
          validation_data=(X_test, Y_test))

score, accuracy = model.evaluate(X_test, Y_test, verbose=0)
print('Test score:', score)
print('Test accuracy:', accuracy)







## Sequential model:
model = Sequential()

# Input convolutional layer with 32 filter, each filter is a 3x3 kernel
model.add(Conv2D(nb_filters, (nb_conv, nb_conv),
                        padding='valid',
                        input_shape=shape_ord))

# Non linear activation function
model.add(Activation('relu'))

# Flattening of the 32 matrix
model.add(Flatten())

# Hidden dense layer of 128 nodes
model.add(Dense(128))
model.add(Activation('relu'))
model.add(Dropout(0.5))

# Output dense layer of 2 nodes
model.add(Dense(nb_classes))
model.add(Activation('softmax'))


model.compile(loss='categorical_crossentropy',
              optimizer='sgd',
              metrics=['accuracy'])

model.fit(X_train, 
          Y_train, 
          batch_size=batch_size, 
          epochs=nb_epoch,
          verbose=2,
          validation_data=(X_test, Y_test),
          callbacks=[early_stop])

#Evaluating the model on the test data    
score, accuracy = model.evaluate(X_test, Y_test, verbose=0)
print('Test score:', score)
print('Test accuracy:', accuracy)

slice = 15
predicted = model.predict(X_test[:slice])
print(predicted)

predicted = model.predict(X_test[:slice]).argmax(axis=1)

plt.figure(figsize=(16,8))

for i in range(slice):
    plt.subplot(1, slice, i+1)
    plt.imshow(X_test_orig[i], interpolation='nearest', cmap=mpl.cm.Blues)
    plt.text(0, 0, predicted[i], color='black', 
             bbox=dict(facecolor='white', alpha=1))
    plt.axis('off')