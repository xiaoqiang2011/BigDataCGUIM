

exampleV <- c('1', '2', '3A', '4', '5')

for (i in 1:length(exampleV))
{
    tryCatch({
        print(as.numeric(exampleV[i]))
    }, warning = function(w) {
        print(w)
    }, error = function(e) {
        print(e)
    }, finally = {
        
    })
}
