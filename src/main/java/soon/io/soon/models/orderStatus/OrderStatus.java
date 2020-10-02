package soon.io.soon.models.orderStatus;

public enum OrderStatus {

    PLACED() {
        @Override
        public boolean isPlaced() {
            return true;
        }
    },

    ACCEPTED() {
        @Override
        public boolean isAccepted() {
            return true;
        }
    },
    REJECTED() {
        @Override
        public boolean isRejected() {
            return true;
        }
    },
    PROCESSING() {
        @Override
        public boolean isProcessing() {
            return true;
        }
    },
    DELIVERED() {
        @Override
        public boolean isDelivered() {
            return true;
        }
    };

    public boolean isPlaced() {
        return false;
    }

    public boolean isAccepted() {
        return false;
    }

    public boolean isRejected() {
        return false;
    }

    public boolean isProcessing() {
        return false;
    }

    public boolean isDelivered() {
        return false;
    }

}
