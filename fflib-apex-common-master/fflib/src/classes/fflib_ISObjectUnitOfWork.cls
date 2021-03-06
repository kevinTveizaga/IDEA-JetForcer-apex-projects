/*
* FinancialForce.com, inc. claims copyright in this software, its screen
* display designs and supporting documentation. FinancialForce and
* FinancialForce.com are trademarks of FinancialForce.com, inc. Any
* unauthorized use, copying or sale of the above may constitute an
* infringement of copyright and may result in criminal or other legal
* proceedings.
*
* Copyright (c) 2013 FinancialForce.com, inc. All rights reserved.
*/

/**
 * @see fflib_SObjectUnitOfWork
 **/
public interface fflib_ISObjectUnitOfWork
{
	/**
	 * Register a newly created SObject instance to be inserted when commitWork is called
	 *
	 * @param record A newly created SObject instance to be inserted during commitWork
	 **/	
	void registerNew(SObject record);
	/**
	 * Register a newly created SObject instance to be inserted when commitWork is called,
	 *   you may also provide a reference to the parent record instance (should also be registered as new separatly)
	 *
	 * @param record A newly created SObject instance to be inserted during commitWork
	 * @param relatedToParentField A SObjectField reference to the child field that associates the child record with its parent
	 * @param relatedToParentRecord A SObject instance of the parent record (should also be registered as new separatly)
	 **/	
	void registerNew(SObject record, Schema.sObjectField relatedToParentField, SObject relatedToParentRecord);
	/**
	 * Register a relationship between two records that have yet to be inserted to the database. This information will be
	 *  used during the commitWork phase to make the references only when related records have been inserted to the database.
	 *
	 * @param record An existing or newly created record
	 * @param relatedToField A SObjectField referene to the lookup field that relates the two records together
	 * @param relatedTo A SOBject instance (yet to be commited to the database)
	 */	
	void registerRelationship(SObject record, Schema.sObjectField relatedToField, SObject relatedTo);
	/**
	 * Register an existing record to be updated during the commitWork method
	 *
	 * @param record An existing record
	 **/	
	void registerDirty(SObject record);
	/**
	 * Register an existing record to be deleted during the commitWork method
	 *
	 * @param record An existing record
	 **/	
	void registerDeleted(SObject record);
	/**
	 * Takes all the work that has been registered with the UnitOfWork and commits it to the database
	 **/	
	void commitWork();	
}