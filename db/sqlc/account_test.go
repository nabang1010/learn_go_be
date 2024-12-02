package db

import (
	"context"
	"testing"

	"github.com/nabang1010/learn_go_be/utils"
	"github.com/stretchr/testify/require"
)

func TestCreateAccount(t *testing.T) {
	arg := CreateAccountParams{
		// Owner:    "Tom",
		// Balance:  1000,
		// Currency: "USD",
		Owner:    utils.RandomOwner(),
		Balance:  utils.RandomMoney(),
		Currency: utils.RandomCurrency(),
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)

	if err != nil {
		t.Errorf("error creating account: %v", err)
		require.NoError(t, err)
		require.NotEmpty(t, account)

		require.Equal(t, arg.Owner, account.Owner)
		require.Equal(t, arg.Balance, account.Balance)
		require.Equal(t, arg.Currency, account.Currency)

		require.NotZero(t, account.ID)
		require.NotZero(t, account.CreateAt)

	}

}
