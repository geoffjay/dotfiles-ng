package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

// listCmd represents the list command
var listCmd = &cobra.Command{
	Use:   "list",
	Short: "List the available dotfile profiles",
	Run:   run,
}

func init() {
	rootCmd.AddCommand(listCmd)
}

func run(cmd *cobra.Command, args []string) {
	fmt.Println("List profiles from service on port:", viper.GetInt("port"))
}
