package com.dotmarketing.logConsole.model;

import com.dotmarketing.business.CacheLocator;
import com.dotmarketing.business.DotCacheAdministrator;
import com.dotmarketing.business.DotCacheException;

import java.util.Collection;

/**
 * Created by Jonathan Gamba.
 * Date: 5/21/12
 * Time: 4:26 PM
 */
public class LogMapperCacheImpl implements LogMapperCache {

    private DotCacheAdministrator cache;

    protected final String primaryGroup = "LogMapperCache";
    protected final String[] groupNames = { primaryGroup };

    private final String KEY_LOGS = primaryGroup + "_ALL";

    public LogMapperCacheImpl () {
        cache = CacheLocator.getCacheAdministrator();
    }

    /**
     * Return all the records stored on cache for this primary group
     *
     * @return
     * @throws DotCacheException
     */
    public Collection<LogMapperRow> get () throws DotCacheException {
        return ( Collection<LogMapperRow> ) cache.get( KEY_LOGS, primaryGroup );
    }

    /**
     * Puts a LogMapperRow collection in a cache.
     *
     * @param logMapperRows
     * @throws DotCacheException
     */
    public void put ( Collection<LogMapperRow> logMapperRows ) throws DotCacheException {
        cache.put( KEY_LOGS, logMapperRows, primaryGroup );
    }

    @Override
    public String getPrimaryGroup () {
        return primaryGroup;
    }

    @Override
    public String[] getGroups () {
        return groupNames;
    }

    @Override
    public void clearCache () {
        cache.flushGroup( primaryGroup );
    }

}