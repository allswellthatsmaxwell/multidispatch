
## call like
## this way allows real default parameters.
add %<-% function(x = 0, y = 0) x + y
add %<-% mfunction(r = "", s = "") paste(r, s, sep = "")

## or
add %<-% mfunction(x = numeric, y = numeric) x + y
add %<-% mfunction(r = character, s = character) paste(r, s, sep = "")


`%<-%` <- function(name, fn) {
    argvec <- formals(fn)
    argtypes <- Map(as.character, argvec)
    sig <- do.call(signature, as.list(argtypes))
    newfn_name <- deparse(substitute(name))
    ## The below line is failing because we need the names of formals(fn) instead of ... .
    if (!exists(newfn_name)) assign(newfn_name, function(...) NULL, pos = topenv(parent.frame()))
    if (exists(newfn_name)) print("exists")
    setMethod(newfn_name, sig, fn)
}

                      






