% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/freeze.R
\name{freeze_layers}
\alias{freeze_layers}
\alias{unfreeze_layers}
\title{Freeze and unfreeze layers}
\usage{
freeze_layers(object, from = NULL, to = NULL)

unfreeze_layers(object, from = NULL, to = NULL)
}
\arguments{
\item{object}{Keras model object}

\item{from}{Layer instance, layer name, or layer index within model}

\item{to}{Layer instance, layer name, or layer index within model}
}
\description{
Freeze layers in a model so that they are no longer trainable.
}
\note{
The \code{from} and \code{to} layer arguments are both inclusive.

The freeze and unfreeze functions are global operations over all layers in
a model (i.e. layers not within the specified range will be set to the
opposite value, e.g. unfrozen for a call to freeze_layers).

Models must be compiled again after layers are frozen or unfrozen.
}
\examples{
\dontrun{
# instantiate a VGG16 model
conv_base <- application_vgg16(
  weights = "imagenet",
  include_top = FALSE,
  input_shape = c(150, 150, 3)
)

# freeze it's layers
freeze_layers(conv_base)

# create a composite model that includes the base + more layers
model <- keras_model_sequential() \%>\%
  conv_base \%>\%
  layer_flatten() \%>\%
  layer_dense(units = 256, activation = "relu") \%>\%
  layer_dense(units = 1, activation = "sigmoid")

# compile
model \%>\% compile(
  loss = "binary_crossentropy",
  optimizer = optimizer_rmsprop(lr = 2e-5),
  metrics = c("accuracy")
)

# unfreeze layers from "block5_conv1" on
unfreeze_layers(conv_base, from = "block5_conv1")

# compile again since we froze or unfroze layers
model \%>\% compile(
  loss = "binary_crossentropy",
  optimizer = optimizer_rmsprop(lr = 2e-5),
  metrics = c("accuracy")
)

}

}
