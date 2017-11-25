import keras
from keras.utils.np_utils import to_categorical
from keras.datasets import fashion_mnist
(X_train, y_train), (X_test, y_test) = fashion_mnist.load_data()


from tensorflow.examples.tutorials.mnist import input_data
data = input_data.read_data_sets('data/fashion')

X_train = data.train.images
X_test = data.test.images
y_train = data.train.labels
y_test = data.test.labels

X_train_orig = X_train.copy()
X_test_orig = X_test.copy()
y_train_orig = y_train.copy()
y_test_orig = y_test.copy()

len_square = int(np.sqrt(X_test.shape[1]))
len_square

# Reshape the pictures
X_train_sq = X_train.reshape(len(X_train),len_square, len_square)
X_test_sq = X_train.reshape(len(X_train),len_square, len_square)

from keras import backend as K
from keras.models import Sequential
from keras.layers.core import Dense
from keras.utils import np_utils

# Select the first 20000 pictures in the training set
num_train = X_train_sq[:20000]
num_pixels = 28*28

max_value = X_train.max()
X_train /= max_value
X_test /= max_value

np.random.seed(1338)

random_rows = np.random.randint(0,X_not_six.shape[0],6000)
X_not_six = X_not_six[random_rows]
Y_not_six = Y_not_six[random_rows]

# Make the response variable a categorical variable
from keras.utils import np_utils

y_train = np_utils.to_categorical(y_train, nb_classes)
y_test = np_utils.to_categorical(y_test, nb_classes)

num_classes = 10

# Set parameters
nb_epoch = 20 
batch_size = 200

## Define a sequential model:
model = Sequential()
num_pixels

# Define an input layer of 28*28 (=784) nodes + Hidden DENSE layer of 784 nodes with a relu activation function
model.add(Dense(num_pixels, input_dim=num_pixels, activation ='relu')

    # Define the output layer of 10 nodes ..which activation function shoud you use?
model.add(Dense(num_classes, activation = "softmax"))

    # Compile the model ..  which kind of loss best fits our problem?
model.compile(loss="categorical_crossentropy",
              optimizer="adam",
              metrics=['accuracy'])
)

model.summary()

# Visalize a summary of the model
# ?











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
