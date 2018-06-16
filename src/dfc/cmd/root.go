package cmd

import (
	"fmt"
	"log"
	"os"

	homedir "github.com/mitchellh/go-homedir"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	cfgFile string
	port    int

	rootCmd = &cobra.Command{
		Use:   "dfc",
		Short: "Client app to work interface with the dotfiles service",
		Long:  `A gRPC client that communicates with the service handling user dotfile profiles.`,
	}
)

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		log.Fatal(err)
	}
}

func init() {
	cobra.OnInitialize(initConfig)

	rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "config file (default is $HOME/.dfc.yaml)")
	rootCmd.Flags().IntP("port", "p", 0, "the port to use")

	viper.BindPFlag("port", rootCmd.Flags().Lookup("port"))
	viper.SetDefault("port", "4000")
}

// initConfig reads in config file and ENV variables if set.
func initConfig() {
	if cfgFile != "" {
		// Use config file from the flag.
		viper.SetConfigFile(cfgFile)
	} else {
		// Find home directory.
		home, err := homedir.Dir()
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}

		// Search config in home directory with name ".hpc" (without extension).
		viper.AddConfigPath(home)
		viper.SetConfigName(".dfc")

		// Search in the system if it still hasn't been found
		//viper.AddConfigPath("/etc/dotfiles-ng/")
	}

	viper.AutomaticEnv()

	if err := viper.ReadInConfig(); err == nil {
		fmt.Println("Using config file:", viper.ConfigFileUsed())
	}
}
