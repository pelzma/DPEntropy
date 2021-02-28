dp <- read_csv("C:/Users/pelzm/Desktop/Math Research/Boolean research projects/network entropy plots/5/meansTable.csv")
control <- read_csv("C:/Users/pelzm/Desktop/Math Research/Boolean research projects/network entropy plots/5C/meansTable.csv")
margin <- full_join(dp, control, by="X1", "redux")
margin$margin <- margin$values.x - margin$values.y
colnames(margin) <- c("void", "NodeReductions", "Reduction by DP", "void2", "Reducation at random", "EntropyRatioDifference")
marginPlot <- ggplot(margin, aes(NodeReductions, EntropyRatioDifference)) +
  geom_line() + ylim(0, 0.35) +
  labs(x = "Node Reductions", y = "Entropy Ratio Difference") + theme(axis.text=element_text(size=14), axis.title=element_text(size=16)) +
  theme(legend.text=element_text(size=14)) + 
  theme(legend.title=element_text(size=16))
ggsave("marginPlot.png", width = 25, height = 20, units = "cm")
ggsave("marginPlot.pdf", width = 25, height = 20, units = "cm")

margin2 <- full_join(dp, control, by="X1", "redux")
colnames(margin2) <- c("X1", "redux.x", "Reduction by DP", "redux.y", "Random reduction")
margin2 <- margin2[-(4)]
margin2 <- margin2[-(1)]
margin2 <- melt(margin2, id="redux.x")
marginPlot2 <- ggplot(margin2, aes(redux.x, value)) +
  geom_line(aes(linetype = variable)) +
  theme(legend.title = element_blank()) +
  labs(x = "Node Reductions", y = "Entropy Ratio") +
  theme(legend.position="bottom") + theme(axis.text=element_text(size=14), axis.title=element_text(size=16)) +
  theme(legend.text=element_text(size=14)) + 
  theme(legend.title=element_text(size=16))
ggsave("marginPlot2.png", width = 25, height = 20, units = "cm")
ggsave("marginPlot2.pdf", width = 25, height = 20, units = "cm")
