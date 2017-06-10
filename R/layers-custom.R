

#' @export
KerasLayer <- R6Class("KerasLayer",
  
  lock_objects = FALSE,                      
  
  public = list(
    
    # TODO: standard layer args
    initialize = function() {
      
      # import layer utility module
      python_path <- system.file("python", package = "keras")
      tools <- import_from_path("kerastools", path = python_path)
      
      private$py_layer <- tools$layer$RLayer(
        function (input_shape) self$build(input_shape),
        function (x) self$call(x),
        function (input_shape) self$compute_output_shape(input_shape)
      )
    },
    
    build = function(input_shape) {
      
    },
    
    call = function(x) {
      
    },
    
    compute_output_shape = function(input_shape) {
      
    }
  ),
  
  private = list(
    py_layer = NULL
  )
)