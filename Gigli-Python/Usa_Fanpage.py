import pandas as pd
import matplotlib.pyplot as plt
import matplotlib

matplotlib.style.use('ggplot')
plt.rcParams['figure.figsize'] = (15,5)
path = "C:/Users/GiulioVannini/Documents/Visual Studio 2017/Projects/MABIDA2017/Gigli-Python/"

statuses_df = pd.read_csv(path + "nytimes_facebook_statuses.csv", sep = ",", parse_dates = ['status_published'], dayfirst = True, index_col='status_published' )

statuses_df.head()
statuses_df.shape()
statuses_df.columns
statuses_df.dtypes
statuses_df.describe()

statuses_df = statuses_df.dropna()

matplotlib.rc("font", family="sans-serif")
matplotlib.rc("font", serif="Helvetica Neue")
matplotlib.rc("text", usetex="false")

statuses_df["num_likes"].plot()
plt.show()

statuses_df.ix[:"2013-01-01"]["num_likes"].plot()
plt.show()

statuses_df.loc[:,'weekday'] = statuses_df
plt.show()

weekday_counts = statuses_df.groupby("weekday").aggregate(sum)
weekday_counts

weekday_counts.index = ["Monday", 
                        "Tuesday", 
                        "Wednesday", 
                        "Thursday", 
                        "Friday", 
                        "Saturday", 
                        "Sunday"]
weekday_counts

weekday_counts.plot(kind="bar")

from numpy import median
statuses_df.loc[:, "Hour"] = statuses_df.index.hour
statuses_df.groupby("Hour")["num_likes"].aggregate(median).plot()
statuses_df.groupby("Hour")["num_shares"].aggregate(median).plot()

reactions_df = pd.read_csv(path + "nytimes_facebook_statuses_reactions.csv", sep=",")
reactions_df.head()

status_col_sel = ["status_id", 
                  "status_message", 
                  "status_link",
                  "num_comments",
                  "num_shares",
                  "weekday",
                  "Hour"]

vanity_metrics = pd.merge(statuses_df[status_col_sel], reactions_df, on = 'status_id')
vanity_metrics.head()
vanity_metrics.dtypes

vanity_metrics = statuses_df[status_col_sel].reset_index()

metrics_to_plot = ["num_like", 
                   "num_love", 
                   "num_wow", 
                   "num_haha", 
                   "num_love", 
                   "num_angry", 
                   "num_sad"]
vanity_metrics.ix[:"2016-01-01"][metrics_to_plot].plot()
vanity_metrics.ix[:"2016-01-01"]["num_haha"].plot()

day_with_max_like = vanity_metrics["num_like"].argmax()
day_with_max_haha = vanity_metrics["num_haha"].argmax()
day_with_max_love = vanity_metrics["num_love"].argmax()
day_with_max_angry = vanity_metrics["num_angry"].argmax()
day_with_max_sad = vanity_metrics["num_sad"].argmax()
day_with_max_like = vanity_metrics["num_like"].argmax()


























