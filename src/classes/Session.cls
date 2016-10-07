public virtual class Session {

    public Id contactId() {
        String id = Network.getNetworkId();
        if (id == null) {
            return fakeContactId();
        } else {
            String userId = UserInfo.getUserId();
            User u = [SELECT contactId FROM User WHERE Id = :userId];
            return  u.contactId;
        }
    }

    public virtual Id slaveId() { return null; }

    public virtual Id fakeContactId() { return null; }
}
