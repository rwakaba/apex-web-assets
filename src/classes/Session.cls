public virtual class Session {

    private Id contactId; // cache

    /**
     * Return ID of the Contact associated with this user. 
     * If Communities isn’t enabled for the user’s organization or the user is currently in the internal organization, returns fakeContactId.
     */
    public Id contactId() {
        if (contactId != null) {
            return contactId;
        }

        String id = Network.getNetworkId();
        if (id == null) {
            return fakeContactId();
        } else {
            String userId = UserInfo.getUserId();
            User u = [SELECT contactId FROM User WHERE Id = :userId];
            return  u.contactId;
        }
    }

    /**
     * Return the fake contact id.
     * While Communities isn’t enabled for the user’s organization or the user is currently in the internal organization, 
     * for development, you want the contact id as entry point of session user, override this method.
     */
    public virtual Id fakeContactId() { return null; }

    /**
     * Return the contact's slave id.
     * If your application use CustomObject as to extend account information, override this method.
     */
    public virtual Id slaveId() { return null; }
}
